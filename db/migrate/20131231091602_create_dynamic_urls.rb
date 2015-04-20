class CreateDynamicUrls < ActiveRecord::Migration
  def change
    create_table :dynamic_urls do |t|
      t.string :url

      t.timestamps
    end
  end
end
