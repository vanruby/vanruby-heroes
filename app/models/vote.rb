class Vote < ActiveRecord::Base
  validates_presence_of :voter, :nominee, :reason

  scope :for_nominee, ->(nominee) { where(nominee: nominee) }

  validate :validate_githubs

  private

  def validate_githubs
    %w(voter nominee).each do |attribute|
      if GithubUser.find(self[attribute]).nil?
        errors.add(attribute, :invalid)
      end
    end
  end
end
