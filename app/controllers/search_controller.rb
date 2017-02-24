class SearchController < ApplicationController

  def index
    @stores = Store.find_by_zipcode(params[:q])
    @total_stores = StoreService.total_stores(params[:q])
  end
end
