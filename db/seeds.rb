require "net/http"
require "json"

# Helper: request a URL and return the parsed JSON
def fetch_json(url)
  JSON.parse(Net::HTTP.get(URI(url)))
end

# Clear old data (children first) so the seed can be re-run safely
TeamMember.destroy_all
Typing.destroy_all
Trainer.destroy_all
Pokemon.destroy_all
ElementType.destroy_all

# ---- Data source 1: PokeAPI /type endpoint (the 18 standard types) ----
fetch_json("https://pokeapi.co/api/v2/type?limit=18")["results"].each do |type|
  ElementType.create!(name: type["name"])
end

# ---- Data source 2: PokeAPI /pokemon endpoint (first 151 Pokémon) ----
(1..151).each do |id|
  data = fetch_json("https://pokeapi.co/api/v2/pokemon/#{id}")

  pokemon = Pokemon.create!(
    name:            data["name"],
    pokedex_number:  data["id"],
    height:          data["height"],
    weight:          data["weight"],
    base_experience: data["base_experience"],
    image_url:       data["sprites"]["front_default"]
  )

  # Link the Pokémon to its types. We look types up by name and let
  # ActiveRecord create its own keys instead of reusing the API's ids.
  data["types"].each do |slot|
    element_type = ElementType.find_by!(name: slot["type"]["name"])
    Typing.create!(pokemon: pokemon, element_type: element_type)
  end
end

# ---- Data source 3: Faker (trainers, each with a team of 6 random Pokémon) ----
20.times do
  trainer = Trainer.create!(
    name:     Faker::Name.name,
    hometown: Faker::Address.city
  )

  Pokemon.order("RANDOM()").limit(6).each do |pokemon|
    TeamMember.create!(
      trainer:  trainer,
      pokemon:  pokemon,
      nickname: Faker::Name.first_name,
      level:    rand(5..100)
    )
  end
end

puts "Seeded #{ElementType.count} types, #{Pokemon.count} Pokémon, #{Typing.count} typings, " \
     "#{Trainer.count} trainers, #{TeamMember.count} team members."
