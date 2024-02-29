class CreatePhalanges < ActiveRecord::Migration[7.0]
  def change
    create_table :phalanges do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 0
      t.string :image
      t.integer :order
      t.timestamps
    end
  end
end
