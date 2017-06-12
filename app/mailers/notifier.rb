class Notifier < ApplicationMailer
  default from: 'no-reply@jungle.com',
    return_path: 'no-reply@jungle.com'

def confirmation(order)
  @order = order
  subject = "Order No. #{@order.id}"
  
  mail(to: @order.email, subject: subject)
  end
end
