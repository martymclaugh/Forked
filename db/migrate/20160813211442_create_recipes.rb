class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :steps, array: true
      t.string :spoon_id
      t.string :cooktime
      t.string :cuisine
      t.string :course
      t.string :image

      t.timestamps
    end
  end
end
