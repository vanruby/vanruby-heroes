class Vote < ActiveRecord::Base
  validates_presence_of :voter, :nominee, :reason
end
