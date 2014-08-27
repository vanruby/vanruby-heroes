class Nominee
  def self.all
    Vote.group(:nominee).count.map do |nominee, count|
      new(github: nominee, votes_count: count)
    end.sort_by(&:votes_count).reverse
  end

  include Virtus.model

  attribute :github, String
  attribute :votes_count, Integer

end
