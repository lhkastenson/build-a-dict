class ChangeDefinitionTypeInEntries < ActiveRecord::Migration
  def change
  	change_column :entries, :definition, :text
  end
end
