class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :key
      t.text :body
      t.string :name

      t.timestamps null: false
    end

    #add_index(:contents, :key, unique: true)
  end
end
