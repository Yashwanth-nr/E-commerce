class Notification < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.order-confirmation.subject
  #
  def order_confirmation(order)
    @order = order

    mail to: @order.user.email, subject: "Oder confirmation #{@order.order_number}"
  end
end
