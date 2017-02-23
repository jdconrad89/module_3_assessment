class SearchController < ApplicationController

  def index
    @stores = FindStores.find_by_zipcode(params[:q])
    byebug
  end
end
