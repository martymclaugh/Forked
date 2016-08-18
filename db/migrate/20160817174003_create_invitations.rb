class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.string :cuisine
      t.datetime :datetime
      t.string :location
      t.integer :creator_id

      t.timestamps
    end
  end
end
