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

    vote = Vote.last

    expect(vote.voter).to eq 'pcreux'
    expect(vote.nominee).to eq 'chancancode'
    expect(vote.reason).to eq 'He makes rails so much lovable!'
  end
end
