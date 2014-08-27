class IdifyGithubColumns < ActiveRecord::Migration
  def change
    rename_column "votes", :voter, :voter_id
    rename_column "votes", :nominee, :nominee_id
  end
end
