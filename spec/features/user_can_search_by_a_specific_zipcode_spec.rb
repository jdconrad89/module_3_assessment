require 'rails_helper'

describe "zipcode search" do
  it " user can search for stores by a specifi zipcode" do

    visit root_path

    fill_in "q", with: "80202"
    click_on "search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("16 Total Stores")
  end
end
