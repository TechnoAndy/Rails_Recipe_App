class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.decimal :preparation_time
      t.decimal :cooking_time
      t.boolean :public

      t.timestamps
    end
  end
end
