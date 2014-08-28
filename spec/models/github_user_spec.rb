require 'rails_helper'

describe GithubUser do
  it "falls back to the login if name is not set" do
    gh_user = GithubUser.new(login: "bob", name: "THE BOB")
    expect(gh_user.name).to eq 'THE BOB'

    gh_user = GithubUser.new(login: "bob", name: "")
    expect(gh_user.name).to eq 'bob'
  end
end
