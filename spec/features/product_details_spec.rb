require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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
  scenario "They see product detail page" do
    # ACT
    visit root_path
    page.find('article.product footer').first(:link,"Details").click
    # page.find('.products article:footer').find_link('Details').click


    # DEBUG
    # save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail', 
    sleep(2)
    save_screenshot
    puts page.html
  end
end
