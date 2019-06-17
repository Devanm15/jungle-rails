# require 'rails_helper'

# RSpec.describe Product, type: :model do
#   before :each do
#       @category = Category.create(name: "Music")
#       @product = @category.products.new({
#         name: 'CD',
#         description: 'this is a test',
#         quantity: 1,
#         price: 1.99,
#       })
#     end 

#     describe "Validations" do
#       it "is valid with all required fields" do
#         expect(@product).to be_valid
#       end

#     it "is not valid without a name" do
#       @product.name = nil,
      
#       expect(@product).errors.full_messages
#   end

#   it "is not valid without a price" do
#     @product.price = nil
#     expect(@product).errors.full_messages 
# end

# it "is not valid without a quantity" do
#   @product.quantity= nil
#   expect(@product).errors.full_messages 
# end

# it "is not valid without a category" do
#   @product.category= nil
#   expect(@product).errors.full_messages 
# end
# end
# end