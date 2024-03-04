class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 0
      t.string :file
      t.timestamps
    end
  end
end
