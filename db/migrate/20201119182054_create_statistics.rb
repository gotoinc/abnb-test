class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.datetime :date
      t.boolean :available, default: false, null: false
      t.decimal :price, precision: 15, scale: 2
      t.references :listing, null: false
    end

    add_index :statistics, %i[listing_id date], unique: true
  end
end
