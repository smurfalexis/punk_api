class BeersController < ApplicationController
  def index
    if params[:search] && params[:search][:keyword].present?
      @key_word = params[:search][:keyword]
      @beers = Beer.search_by_keyword(params[:search][:keyword])
      @response = @beers.empty? ? "The beer you're looking for hasn't been brewed yet!" : 'Here are some nice doggos!'
    else
      @beers = []
      @response = "It seems like you didn't type anything. Try again!"
    end
  end
end
