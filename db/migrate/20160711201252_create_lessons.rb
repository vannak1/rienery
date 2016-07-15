class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :content
      t.boolean :locked?, default: true
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
