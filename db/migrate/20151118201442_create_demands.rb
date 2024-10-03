class CreateDemands < ActiveRecord::Migration[7.2]
  def change
    create_table :demands do |t|
      t.text :description
      t.integer :retrospective_id
      t.string :user
      t.boolean :status, default: false

      t.timestamps
    end

    add_index :demands, :retrospective_id
  end
end
