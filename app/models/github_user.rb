require 'open-uri'

class GithubUser
  def self.find(nickname)
    raise ArgumentError, "nickname can't be nil" if nickname.blank?

    Rails.cache.fetch "github-#{nickname}" do
      response = open("https://api.github.com/users/#{nickname}").read
      new(JSON.parse(response))
    end

  rescue OpenURI::HTTPError => e
    if e.to_s == '404 Not Found'
      nil
    else
      raise e
    end
  end

  include Virtus.model

  attribute :login, String
  attribute :id, Integer
  attribute :avatar_url, String
  attribute :gravatar_id, String
  attribute :url, String
  attribute :html_url, String
  attribute :name, String
  attribute :company, String
  attribute :blog, String
  attribute :location, String
  attribute :email, String
  attribute :bio, String
  attribute :public_repos, Integer
  attribute :public_gists, Integer
  attribute :followers, Integer
  attribute :following, Integer
  attribute :created_at, Time
  attribute :updated_at, Time

  def name
    da_name = @name
    da_name = login if da_name.blank?

    da_name
  end
end
