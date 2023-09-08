class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :group, foreign_key: true
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
