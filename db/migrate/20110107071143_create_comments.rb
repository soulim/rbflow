class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.belongs_to  :item
      t.belongs_to  :user
      t.text        :markdown
      t.text        :html
      t.timestamps
    end
    
    add_index :comments, :item_id
    add_index :comments, :user_id
  end

  def self.down
    drop_table :comments
  end
end
