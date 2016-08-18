class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :spoon_id
      t.string :cooktime
      t.string :cuisine
      t.string :course
      t.string :image
      t.float :rating, default: 5

      t.timestamps
    end
  end
end
