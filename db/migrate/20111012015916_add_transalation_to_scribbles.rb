class AddTransalationToScribbles < ActiveRecord::Migration
  def self.up
    add_column :scribbles, :enable_translate, :boolean
    add_column :scribbles, :select_language, :string
  end

  def self.down
    remove_column :scribbles, :select_language
    remove_column :scribbles, :enable_translate
  end
end
