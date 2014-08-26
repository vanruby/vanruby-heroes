class VotesController < ApplicationController
  def create
    @vote = Vote.create!(vote_params)
    redirect_to :root, notice: "Thanks for voting!"
  end

  private

  def vote_params
    params.require(:vote).permit(:voter, :nominee, :reason)
  end
end
