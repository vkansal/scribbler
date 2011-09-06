class CreateScribbles < ActiveRecord::Migration
  def self.up
    create_table :scribbles do |t|
      t.boolean :streaming
      t.text :filters
      t.text :params

      t.timestamps
    end
  end

  def self.down
    drop_table :scribbles
  end
end
