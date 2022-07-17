require 'rails_helper'

RSpec.describe Beer, :type => :model do
  punk_ipa = Beer.create(name: 'Punk IPA', abv: 5.4, tagline: 'Post modern classic. Spiky. Tropical. Hoppy',
                         description: "Our flagship beer that kick started the craft beer revolution.
                         This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops.
                         Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
                         food: ['Spicy carne asada with a pico de gallo sauce', 'Shredded chicken tacos with a mango chilli lime salsa',
                                'Cheesecake with a passion fruit swirl sauce'],
                         image: 'https://presshub.brewdog.com/images/cms/large/1440777209BREWDOGLOGO.jpg')

  it "is valid with valid attributes" do
    expect(punk_ipa).to be_valid
  end

  it "is not valid without a name" do
    punk_ipa.name = nil
    expect(punk_ipa).to_not be_valid
  end

  it "is not valid without an abv" do
    punk_ipa.abv = nil
    expect(punk_ipa).to_not be_valid
  end

  it "is not valid without a tagline" do
    punk_ipa.tagline = nil
    expect(punk_ipa).to_not be_valid
  end

  it "is not valid without a description" do
    punk_ipa.description = nil
    expect(punk_ipa).to_not be_valid
  end

  it "is not valid without food recommendations" do
    punk_ipa.food = nil
    expect(punk_ipa).to_not be_valid
  end

  it "is not valid without an image" do
    punk_ipa.image = nil
    expect(punk_ipa).to_not be_valid
  end
end
