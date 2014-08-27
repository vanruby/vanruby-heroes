class Vote < ActiveRecord::Base
  validates_presence_of :voter, :nominee, :reason

  scope :for_nominee, ->(nominee) { where(nominee: nominee) }
end
