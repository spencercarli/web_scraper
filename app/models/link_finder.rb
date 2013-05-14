class LinkFinder < ActiveRecord::Base
  attr_accessible :url, :service_selection, :name, :ics_url
end
