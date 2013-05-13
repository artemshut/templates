class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.attachment :avatar
      t.references :post

      t.timestamps
    end
    add_index :avatars, :post_id
  end
end
