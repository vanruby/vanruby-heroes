require 'rails_helper'

describe "nominate a heroe", :vcr do
  before do
    Rails.cache.clear
  end

  it "persists the nomination" do
    visit '/'
    fill_in 'vote_nominee_id', with: 'chancancode'
    fill_in 'vote_reason', with: "He makes rails so much lovable!"
    fill_in 'vote_voter_id', with: 'pcreux'
    expect {
      click_button 'Submit'
    }.to change { Vote.count }.by 1

    expect(page.body).to include "Thanks"
    expect(page.body).to include "chancancode"

    vote = Vote.last

    expect(vote.voter_id).to eq 'pcreux'
    expect(vote.nominee_id).to eq 'chancancode'
    expect(vote.reason).to eq 'He makes rails so much lovable!'
  end

  it "does not allow invalid github users" do
    visit '/'
    fill_in 'vote_nominee_id', with: 'chancancode'
    fill_in 'vote_reason', with: "He makes rails so much lovable!"
    fill_in 'vote_voter_id', with: 'INVALID_GITHUB_USER_1234'
    expect {
      click_button 'Submit'
    }.to_not change { Vote.count }

    expect(page.body).to include "is invalid"
  end
end
