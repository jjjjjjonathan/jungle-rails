class OrderMailer < ApplicationMailer
  default from: 'no-replay@jungle.com'

  def order_receipt(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: "Your Jungle receipt for Order ##{order.id}" )
  end
end
