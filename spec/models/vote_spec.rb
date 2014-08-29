require 'rails_helper'

RSpec.describe Vote, :type => :model do
  it "downcases github handles" do
    vote = Vote.new(voter_id: "Bob", nominee_id: "KalvIr -Yo")
    expect(vote.voter_id).to eq "bob"
    expect(vote.nominee_id).to eq "kalvir-yo"
  end
end
