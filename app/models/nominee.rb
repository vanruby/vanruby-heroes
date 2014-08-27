class Nominee
  # @return [Array] of [Nominee] ordered by votes high to low
  def self.all
    Vote.group(:nominee_id).count.map do |nominee_id, count|
      new(github_id: nominee_id, votes_count: count)
    end.sort_by(&:votes_count).reverse
  end

  include Virtus.model

  attribute :github_id, String
  attribute :votes_count, Integer

  delegate :name, :login, :avatar_url, to: :github_user

  def github_user
    @github_user ||= GithubUser.find(github_id)
  end

  def votes
    Vote.for_nominee(github_id)
  end

end
