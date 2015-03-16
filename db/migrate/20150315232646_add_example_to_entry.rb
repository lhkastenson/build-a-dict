class AddExampleToEntry < ActiveRecord::Migration
  def change
  	add_column :entries, :example, :text
  end
end
