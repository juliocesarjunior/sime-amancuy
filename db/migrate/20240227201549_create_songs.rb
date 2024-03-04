class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.references :phalange, foreign_key: true
      t.string :name
      t.text :description
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
