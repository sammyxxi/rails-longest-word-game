require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    # require open-uri library
    # put url in var
    # open the url
    # turn the json to hash - json.parse
    # store found in a var
    # if found its english (view)
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    doc = URI.open(url).read
    doc = JSON.parse(doc)
    @found = doc['found']
    @letters = params[:letters].split
    @included = @word.chars.all? { |letter| @letters.include?(letter) }
  end
end
