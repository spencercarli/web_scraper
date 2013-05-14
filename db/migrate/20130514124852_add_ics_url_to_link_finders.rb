class AddIcsUrlToLinkFinders < ActiveRecord::Migration
  def change
    add_column :link_finders, :ics_url, :string
  end
end
