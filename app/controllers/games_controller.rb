class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { rand(1..9) }
  end

  def score

  end
end
