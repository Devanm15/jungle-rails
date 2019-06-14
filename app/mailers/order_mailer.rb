class OrderMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_email(order, cart_total)
        # @user_first_name = "user_first_name"
        @order = order 
        @total_amount = cart_total
        mail(to: 'kvirani@gmail.com', subject: "#{@order.id}")
        
    end
end
