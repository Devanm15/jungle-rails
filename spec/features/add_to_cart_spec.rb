require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "The cart increases when the add button is clicked" do
    # ACT
    visit root_path

    first(:button, "Add").click

    # DEBUG
    # save_screenshot

    # VERIFY
    within('nav') { expect(page).to have_content('My Cart (1)') }
    sleep(2)
    save_screenshot
    puts page.html
  end
end
