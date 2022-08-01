require 'rake'
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
    if Beer.where(name: beer['name']) == []
      image = beer['image_url'] == nil? ? default_image : beer['image_url']
      beer_new = Beer.new(name: beer['name'], abv: beer['abv'], tagline: beer['tagline'],
                  description: beer['description'], food: beer['food_pairing'],
                  image: image)
      beer_new.save!
    end
  end
end

namespace :beer do
  desc 'Call Punk API and check for new beers'
  task new_beers: :environment do
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
end
