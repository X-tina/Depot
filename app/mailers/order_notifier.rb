class OrderNotifier < ActionMailer::Base
  default from: "Depot@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.recieved.subject
  #
  def recieved(order)
    #@greeting = "Hi"
    @order = order
    #mail to: "to@example.org"
    mail to: order.email, subject: 'The order confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
   # @greeting = "Hi"
    #mail to: "to@example.org"
    @oreder = order
    mail to: order.email, subject: 'Your oreder was shipped'
  end
def error_occured(error)
  @error = error
  mail to: "admin@example.com", subject: 'Depot App Error Incident' 
end

end
