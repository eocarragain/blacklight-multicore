# -*- encoding : utf-8 -*-
#
class PagesController < ApplicationController

  include Blacklight::Catalog
  def initialize
    super
    solr_repository.blacklight_solr = blacklight_solr
  end

  def blacklight_solr
    url = "#{Blacklight.solr_config[:url]}/pages"
    @blacklight_solr ||= RSolr.connect({:url=>url})
  end

  configure_blacklight do |config|
    #override config - see CatalogController as an example
  end

end
