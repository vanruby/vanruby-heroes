class Vote < ActiveRecord::Base
  validates_presence_of :voter_id, :nominee_id, :reason
  validates_uniqueness_of :voter_id, message: "you've nominated someone already"

  scope :for_nominee, ->(nominee_id) { where(nominee_id: nominee_id) }

  validate :validate_githubs

  # @return [GithubUser]
  def voter
    GithubUser.find(voter_id)
  end

  # @return [GithubUser]
  def nominee
    GithubUser.find(nominee_id)
  end

  def voter_id=(github)
    self['voter_id'] = github.downcase
  end

  def nominee_id=(github)
    self['nominee_id'] = github.downcase
  end

  private

  def validate_githubs
    %w(voter_id nominee_id).each do |attribute|
      github_id = self[attribute]
      next if github_id.blank?

      if GithubUser.find(self[attribute]).blank?
        errors.add(attribute, :invalid)
      end
    end
  end
end
