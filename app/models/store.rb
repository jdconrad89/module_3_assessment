class Store
   attr_reader :long_name, :city,
               :distance,  :phone_number,
               :store_type

  def initialize(store)
   @long_name    = store["longName"]
   @city         = store["city"]
   @distance     = store["distance"]
   @phone_number = store["phone"]
   @store_type   = store["storeType"]

  end


  def self.find_by_zipcode(zipcode)
     StoreService.get_stores(zipcode).map do |store|
      new(store)
    end
  end

end
