class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.float :abv
      t.string :description
      t.string :food, array: true, default: []

      t.timestamps
    end
  end
end
