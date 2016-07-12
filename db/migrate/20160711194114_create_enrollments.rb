class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.boolean :completed
      t.datetime :graduate_date
      
      t.timestamps null: false
    end
  end
end
