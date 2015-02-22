class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :body
      t.string :name

      t.timestamps null: false
    end
  end
end
