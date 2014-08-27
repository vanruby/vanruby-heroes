class HomeController < ApplicationController

  def dash
    @nominees = Nominee.all
  end

  def index
    @vote = Vote.new
  end

end
