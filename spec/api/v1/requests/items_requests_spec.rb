require 'rails_helper'

describe "items endpoint" do
  context "GET items" do
    it "can return a JSON response of items" do
      item1 = Item.create!(name: "Turing1", description: "Best School", image_url: "Image1")
      item2 = Item.create!(name: "Turing2", description: "Be prepared", image_url: "Image2")
      item3 = Item.create!(name: "Turing3", description: "It will change your life", image_url: "Image3")

      get "/api/v1/items"

      expect(response).to be_success
      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
      expect(items.first["name"]).to eq("Turing1")
      expect(items.first["description"]).to eq("Best School")
      expect(items.first["image_url"]).to eq("Image1")
    end
  end

  context "GET a single item when given an id" do
    it "can return a JSON response of the given item" do
      item1 = Item.create!(name: "Turing1", description: "Best School", image_url: "Image1")
      item2 = Item.create!(name: "Turing2", description: "Be prepared", image_url: "Image2")
      item3 = Item.create!(name: "Turing3", description: "It will change your life", image_url: "Image3")

      get "api/v1/items/1"

      expect(response).to be_success
      item = JSON.parse(response.body)

      expect(item["name"]).to eq("Turing1")
      expect(item["description"]).to eq("Best School")
      expect(item["image_url"]).to eq("Image1")
    end
  end
end
