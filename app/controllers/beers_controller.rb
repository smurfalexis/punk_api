class BeersController < ApplicationController
  def index
    if params[:search] && params[:search][:keyword].present?
      @key_word = params[:search][:keyword]
      @offset = params[:offset].present? ? params[:offset].to_i : 0
      @result = Beer.search_by_keyword(params[:search][:keyword])
      @beers = Beer.search_by_keyword(params[:search][:keyword]).limit(10).offset(@offset)
      @response = @beers.empty? ? "The beer you're looking for hasn't been brewed yet!" : 'Here are some nice doggos!'
    else
      @beers = []
      @response = "It seems like you didn't type anything. Try again!"
    end
  end
end
