class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to :root, notice: "Thanks for voting!"
    else
      flash.now[:error] = "There is something wrong with your nomination"
      render :new
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:voter, :nominee, :reason)
  end
end
