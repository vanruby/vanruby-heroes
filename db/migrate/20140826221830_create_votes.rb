class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voter,   null: false
      t.string :nominee, null: false
      t.text   :reason,  null: false

      t.timestamps null: false
    end
  end
end
