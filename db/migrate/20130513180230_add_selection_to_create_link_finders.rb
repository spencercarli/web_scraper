class AddSelectionToCreateLinkFinders < ActiveRecord::Migration
  def change
  	change_table :link_finders do |t|
  		t.integer :service_selection
  		t.string :name

  	end
  end
end
