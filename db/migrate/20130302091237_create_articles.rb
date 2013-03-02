class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :entry_id
      t.text :body

      t.timestamps
    end
  end
end
