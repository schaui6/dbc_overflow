class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :poster_id
      t.string :title
      t.string :description

      t.timestamps null:false
    end
  end
end
