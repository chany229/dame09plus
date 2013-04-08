class CreateAdminGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :js_file

      t.timestamps
    end
  end
end
