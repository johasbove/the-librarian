class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :origin_country
      t.integer :founded_year
      t.string :founder

      t.timestamps
    end
  end
end
