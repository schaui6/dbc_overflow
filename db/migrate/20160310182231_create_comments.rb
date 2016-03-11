class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.references :commentable, polymorphic: true, index: true
      t.string :description

      t.timestamps null: false
    end
  end
end
