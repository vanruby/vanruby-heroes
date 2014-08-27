class HomeController < ApplicationController

  def index
    @vote = Vote.new
  end

end
