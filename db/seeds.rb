# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

def punk_api(page)
  url = "https://api.punkapi.com/v2/beers?page=#{page}&per_page=80"
  response = URI.open(url).read
  JSON.parse(response)
end

def save_beers(result)
  default_image = 'https://images.punkapi.com/v2/keg.png'
  result.each do |beer|
    image = beer['image_url'] == nil? ? default_image : beer['image_url']
    Beer.create(name: beer['name'], abv: beer['abv'], tagline: beer['tagline'],
                description: beer['description'], food: beer['food_pairing'],
                image: image)
  end
end

def beers
  page = 1
  limit = 80
  result = punk_api(page)
  while result.length == limit
    save_beers(result)
    page += 1
    result = punk_api(page)
  end
  save_beers(result)
end

beers
