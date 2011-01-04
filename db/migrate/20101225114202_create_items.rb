class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.belongs_to  :user
      t.string      :title
      t.text        :markdown
      t.text        :html
      
      t.timestamps
    end
    
    add_index :items, :created_at
    add_index :items, :user_id
  end

  def self.down
    drop_table :items
  end
end
