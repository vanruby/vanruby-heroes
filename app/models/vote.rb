class Vote < ActiveRecord::Base
  validates_presence_of :voter_id, :nominee_id, :reason

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

  private

  def validate_githubs
    %w(voter_id nominee_id).each do |attribute|
      if GithubUser.find(self[attribute]).blank?
        errors.add(attribute, :invalid)
      end
    end
  end
end
