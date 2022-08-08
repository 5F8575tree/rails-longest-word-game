require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    # Be AWARE: We don't have access to this variable directly from here!
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters].split
    @word = params[:word]
    @wordLetters = params[:word].split
    # we need to compare the arrays to see if the letters are in the word
    @wordLetters.each do |letter|
      if !@letters.include?(letter)
        @message = "Sorry, but #{@word} can't be built out of #{@letters}"
      end
      p @message
    end

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    check_validity = URI.open(url).read
    # Turns a JSON string into a Ruby array of Hashes.
    @result = JSON.parse(check_validity)
    if @result
      @display_result = "#{@word} is valid!"
    else
      @display_result = "#{@word} is not valid!"
    end
  end
end
