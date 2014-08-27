class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to :root, notice: "Thanks for voting!"
    else
      render "home/index"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:voter_id, :nominee_id, :reason)
  end
end
