class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :word
      t.string :definition
      t.string :text
      t.text :origin
      t.text :author

      t.timestamps null: false
    end
  end
end
