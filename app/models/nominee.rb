class Nominee
  def self.all
    Vote.group(:nominee).count.map do |nominee, count|
      new(github: nominee, votes_count: count)
    end.sort_by(&:votes_count).reverse
  end

  include Virtus.model

  attribute :github, String
  attribute :votes_count, Integer

  delegate :name, :login, :avatar_url, to: :github_user

  def github_user
    @github_user ||= GithubUser.find(github)
  end

  def votes
    Vote.for_nominee(login)
  end

end
