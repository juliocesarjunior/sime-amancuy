class CreateArchives < ActiveRecord::Migration[7.0]
  def change
    create_table :archives do |t|
      t.references :song, null: false, foreign_key: true
      t.string :file
      t.string :name
      t.timestamps
    end
  end
end
