class CreateRetrospectives < ActiveRecord::Migration[7.2]
  def change
    create_table :retrospectives do |t|
      t.string :title
      t.datetime :date
      t.integer :room

      t.timestamps
    end
  end
end
