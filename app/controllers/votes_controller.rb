class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    @vote.ip_address = request.remote_ip

    if @vote.save
      redirect_to :root, notice: "We've got your submission. Thanks for voting!"
    else
      render "home/index"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:voter_id, :nominee_id, :reason)
  end

end
