require 'rails_helper'

RSpec.feature "Visitor adds a product to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
   
  end

  scenario "They can click on add to cart and see their cart increase by 1 " do
    # ACT
    visit root_path
    expect(page).to have_text 'My Cart (0)'
    click_on('Add')

    # DEBUG
    #save_screenshot
    

    # VERIFY
    expect(page).to have_text 'My Cart (1)'
    save_screenshot
   # puts page.html
  end
end