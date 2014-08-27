require 'rails_helper'

describe "nominate a heroe", :vcr do
  before do
    Rails.cache.clear
  end

  it "persists the nomination" do
    visit '/'
    fill_in 'vote_nominee', with: 'chancancode'
    fill_in 'vote_reason', with: "He makes rails so much lovable!"
    fill_in 'vote_voter', with: 'pcreux'
    expect {
      click_button 'Nominate'
    }.to change { Vote.count }.by 1

    expect(page.body).to include "Thanks"
    expect(page.body).to include "chancancode"

    vote = Vote.last

    expect(vote.voter).to eq 'pcreux'
    expect(vote.nominee).to eq 'chancancode'
    expect(vote.reason).to eq 'He makes rails so much lovable!'
  end

  it "does not allow invalid github users" do
    visit '/'
    fill_in 'vote_nominee', with: 'chancancode'
    fill_in 'vote_reason', with: "He makes rails so much lovable!"
    fill_in 'vote_voter', with: 'INVALID_GITHUB_USER_1234'
    expect {
      click_button 'Nominate'
    }.to_not change { Vote.count }

    expect(page.body).to include "There is something wrong with your nomination"
  end
end
