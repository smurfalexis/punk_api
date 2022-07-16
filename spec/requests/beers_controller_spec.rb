require 'spec_helper'
require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  describe '#index' do

    punk_ipa = Beer.create(name: 'Punk IPA', description: 'This is a nice IPA.')
    buzz = Beer.create(name: 'Buzz', description: 'A light, crisp and bitter IPA.')
    black_dog = Beer.create(name: 'Black dog', description: 'Hoppy Black Wheat Stout')

    it 'should return an array with beers if beers were found with the provided keyword' do
      get :index, params: { search: { keyword: 'ipa' } }
      beers_body = assigns(:beers)
      expect(beers_body).to include punk_ipa, buzz
      expect(beers_body).not_to include black_dog
    end

    it 'should return a response message if beers were found with the provided keyword' do
      get :index, params: { search: { keyword: 'ipa' } }
      response_body = assigns(:response)
      expect(response_body).to include 'This is what we found'
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
      expect(response_body).to include "It seems like you didn't type anything. Try typing in a beer"
    end
  end
end
