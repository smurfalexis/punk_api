require 'rails_helper'

RSpec.describe 'routes for beers', type: :routing do
  it "routes '/beers' to the beers controller" do
    expect(get('/beers')).to route_to('beers#index')
  end
end
