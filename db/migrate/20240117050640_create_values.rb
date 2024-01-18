class CreateValues < ActiveRecord::Migration[7.0]
  def change
    create_table :values do |t|
      t.text :job, null: false
      t.text :human_relations, null: false
      t.text :growth, null: false
      t.text :leisure_time, null: false

      t.timestamps
    end
  end
end
