class OrderMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_email(order)
        # @user_first_name = "user_first_name"
        @order = order 
        # @total_amount = total_amount
        mail(to: 'kvirani@gmail.com', subject: "#{@order.id}")
        
    end
end
