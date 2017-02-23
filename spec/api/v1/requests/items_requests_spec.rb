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

      get "/api/v1/items/1"

      expect(response).to be_success
      item = JSON.parse(response.body)

      expect(item["name"]).to eq("Turing1")
      expect(item["description"]).to eq("Best School")
      expect(item["image_url"]).to eq("Image1")
    end
  end

  context "DELETE a single item when given an id" do
    it "can delete an item" do
      item1 = Item.create!(name: "Turing1", description: "Best School", image_url: "Image1")
      item2 = Item.create!(name: "Turing2", description: "Be prepared", image_url: "Image2")
      item3 = Item.create!(name: "Turing3", description: "It will change your life", image_url: "Image3")

      get "api/v1/items"

      expect(response).to be_success
      items = JSON.parse(response.body)

      expect(items.first["name"]).to eq("Turing1")
      expect(items.first["description"]).to eq("Best School")
      expect(items.first["image_url"]).to eq("Image1")

      delete "/api/v1/items/1"
      expect(response).to be_success


      expect(response).to be_success
      expect(response).not_to include("Turing1")
      expect(response).not_to include("Best School")
      expect(response).not_to include("Image1")
    end
  end

  context "POST an item by ID" do
    it "can create an item" do
      item1 = Item.create!(name: "Turing1", description: "Best School", image_url: "Image1")
      item2 = Item.create!(name: "Turing2", description: "Be prepared", image_url: "Image2")
      item3 = Item.create!(name: "Turing3", description: "It will change your life", image_url: "Image3")


      post '/api/v1/items/', item: {:name => "Turing4", :description => "Let's Do This!", :image_url => "Image4" }

      expect(response).to be_success

      get "/api/v1/items/#{Item.last.id}"
      item = JSON.parse(response.body)

      expect(response).to be_success

      expect(item["name"]).to eq("Turing4")
      expect(item["description"]).to eq("Let's Do This!")
      expect(item["image_url"]).to eq("Image4")
    end
  end
end
