class AddWordTypeToEntries < ActiveRecord::Migration
  def change
  	add_column :entries, :word_type, :text
  end
end
