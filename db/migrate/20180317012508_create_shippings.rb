class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :origin
      t.string :destination
      t.integer :distance

      t.timestamps
    end
  end
end
