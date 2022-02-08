require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

    scenario "they are redirected to product details when clicking on product" do
      visit root_path

      click_on("Details")
      expect(page).to have_css "article.product-detail"
      puts page.html
      save_screenshot
    
  end
  
end