class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name , :null => false, :limit => 20
      t.boolean :status, :default => false
      t.date :deadline

      t.timestamps
    end
  end
end
