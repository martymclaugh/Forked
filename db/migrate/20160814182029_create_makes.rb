class CreateMakes < ActiveRecord::Migration[5.0]
  def change
    create_table :makes do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
