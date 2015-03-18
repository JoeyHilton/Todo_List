class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :title
      t.string :category
      t.string :priority
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
