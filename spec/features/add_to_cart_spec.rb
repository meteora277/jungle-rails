require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  before :each do 
    @category = Category.create! name: "Apparel"

    1.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99

      )
    end
  end

  scenario "user clicks on add to cart" do
    visit root_path

    click_on "Add"

    save_screenshot
    expect(page).to have_text "My Cart (1)"

    
  end
  
end
