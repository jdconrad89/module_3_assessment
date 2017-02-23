class StoreService

  def self.find_by_zipcode(zipcode)
    conn = Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV["api_key"]}&show=longName,city,phone,storeType&format=json")
    response = JSON.parse(conn.body, symoblize_names: true)
  end
end
