class SearchPresenter
  attr_reader :stores, :total_stores

  def initialize(zipcode)
    @stores  = Store.find_by_zipcode(zipcode)
    @total_stores = StoreService.total_stores(zipcode)
  end

  def self.present(zipcode)
    new(zipcode)
  end
end
