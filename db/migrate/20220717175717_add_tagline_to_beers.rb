class AddTaglineToBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :beers, :tagline, :string
  end
end
