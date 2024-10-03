class CreateTopics < ActiveRecord::Migration[7.2]
  def change
    create_table :topics do |t|
      t.text :description
      t.string :type
      t.integer :retrospective_id

      t.timestamps
    end

    add_index :topics, :retrospective_id
  end
end
