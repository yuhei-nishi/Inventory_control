class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.date :purchase, null: false
      t.date :expiration, null: false
      t.integer :stock, null: false
      t.timestamps
    end
  end
end
