class AddImageToBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :beers, :image, :string
  end
end
