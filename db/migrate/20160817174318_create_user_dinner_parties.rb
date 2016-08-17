class CreateUserDinnerParties < ActiveRecord::Migration[5.0]
  def change
    create_table :user_dinner_parties do |t|
      t.integer :dinner_party_id
      t.integer :user_id

      t.timestamps
    end
  end
end
