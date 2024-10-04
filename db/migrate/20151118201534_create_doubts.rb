# frozen_string_literal: true

class CreateDoubts < ActiveRecord::Migration[7.2]
  def change
    create_table :doubts do |t|
      t.text :description
      t.integer :retrospective_id

      t.timestamps
    end

    add_index :doubts, :retrospective_id
  end
end
