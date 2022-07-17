require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  punk_ipa = Beer.create(name: 'Punk IPA', abv: 5.4, tagline: 'Post modern classic. Spiky. Tropical. Hoppy',
                         description: "Our flagship beer that kick started the craft beer revolution.
                         This is James and Martin's original take on an American IPA.",
                         food: ['Spicy carne asada with a pico de gallo sauce', 'Shredded chicken tacos with a mango chilli lime salsa',
                                'Cheesecake with a passion fruit swirl sauce'],
                         image: 'https://presshub.brewdog.com/images/cms/large/1440777209BREWDOGLOGO.jpg')

  buzz = Beer.create(name: 'Buzz', abv: 4.5, tagline: 'A real bitter experience',
                     description: 'A light, crisp and bitter IPA.',
                     food: ['Spicy chicken tikka masala', 'Grilled chicken quesadilla',
                            'Caramel toffee cake'],
                     image: 'https://presshub.brewdog.com/images/cms/large/1440777209BREWDOGLOGO.jpg')

  black_dog = Beer.create(name: 'Black dog', abv: 5.5, tagline: 'Hoppy black wheat stout',
                          description: 'Hoppy Black Wheat Stout',
                          food: ['Spicy chicken and chilli verde sauce enchiladas',
                                 'Smoked chorizo and strong cheese board'],
                          image: 'https://presshub.brewdog.com/images/cms/large/1440777209BREWDOGLOGO.jpg')

  describe '#index' do
    it 'should return an array with beers if beers were found with the provided keyword' do
      get :index, params: { search: { keyword: 'ipa' } }
      beers_body = assigns(:beers)
      expect(beers_body).to include punk_ipa, buzz
      expect(beers_body).not_to include black_dog
    end

    it 'should return a response message if beers were found with the provided keyword' do
      get :index, params: { search: { keyword: 'ipa' } }
      response_body = assigns(:response)
      expect(response_body).to include 'Here are some nice doggos!'
    end

    it 'should return an empty array if no beers were found with the provided keyword' do
      get :index, params: { search: { keyword: 'ale' } }
      beers_body = assigns(:beers)
      expect(beers_body).to match_array([])
    end

    it 'should return a response message if no beers were found with the provided keyword' do
      get :index, params: { search: { keyword: 'pale ale' } }
      response_body = assigns(:response)
      expect(response_body).to include "The beer you're looking for hasn't been brewed yet!"
    end

    it 'should return an empty array if a keyword was not provided' do
      get :index, params: { search: { keyword: '' } }
      beers_body = assigns(:beers)
      expect(beers_body).to match_array([])
    end

    it 'should return a response message if a keyword has not been provided' do
      get :index, params: { search: { keyword: '' } }
      response_body = assigns(:response)
      expect(response_body).to include "It seems like you didn't type anything. Try again!"
    end
  end
end
