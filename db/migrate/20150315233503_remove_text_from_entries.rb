class RemoveTextFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :text
  end
end
