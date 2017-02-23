class FindStores

  def self.find_by_zipcode(zipcode)
    StoreService.find_by_zipcode(zipcode)
  end

end 
