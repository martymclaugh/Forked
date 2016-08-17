class CreateUserInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_invitations do |t|
      t.integer :invitation_id
      t.integer :invited_id

      t.timestamps
    end
  end
end
