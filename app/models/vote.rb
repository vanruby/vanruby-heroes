class Vote < ActiveRecord::Base
  validates_presence_of :voter, :nominee, :reason

  scope :for_nominee, ->(nominee) { where(nominee: nominee) }

  validate :validate_githubs

  # @return [GithubUser]
  def voter_user
    GithubUser.find(voter)
  end

  # @return [GithubUser]
  def nominee_user
    GithubUser.find(nominee)
  end

  private

  def validate_githubs
    %w(voter nominee).each do |attribute|
      if GithubUser.find(self[attribute]).nil?
        errors.add(attribute, :invalid)
      end
    end
  end
end
