class Notifier < ApplicationMailer
  default from: 'no-reply@jungle.com',
    return_path: 'no-reply@jungle.com'

  def confirmation(order)
    @order = order
    mail(to: @order.email,
    bcc: ["itsalysia@gmail.com"])
  end
end
