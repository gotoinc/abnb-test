class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :uid, uniq: true
      t.string :url
      t.string :name
      t.string :location
      t.timestamps
    end
  end
end
