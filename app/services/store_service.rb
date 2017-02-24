class StoreService

  def stores(zipcode)
   find_by_zipcode(zipcode)
  end

  def self.get_stores(zipcode)
    new.stores(zipcode)["stores"]
  end

  def self.total_stores(zipcode)
    new.stores(zipcode)["total"]
  end

  private

  def find_by_zipcode(zipcode)
    conn = Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV["api_key"]}&show=longName,city,distance,phone,storeType&format=json")
    response = JSON.parse(conn.body, symoblize_names: true)
  end

end
