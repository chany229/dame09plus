class CreateAdminGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :js_file
      t.integer :width, :default => "600"
      t.integer :height, :default => "600"

      t.timestamps
    end
  end
end
