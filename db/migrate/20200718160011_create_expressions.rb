class CreateExpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :expressions do |t|
      t.text :body
      t.timestamp :created_at
      

      t.timestamps
    end
  end
end
