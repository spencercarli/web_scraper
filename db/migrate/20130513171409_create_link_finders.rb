class CreateLinkFinders < ActiveRecord::Migration
  def change
    create_table :link_finders do |t|
      t.string :url

      t.timestamps
    end
  end
end
