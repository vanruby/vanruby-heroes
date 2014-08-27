class HomeController < ApplicationController
  def index
    @vote = Vote.new(voter_id: last_voter_id)
  end
end
