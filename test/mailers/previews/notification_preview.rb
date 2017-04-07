# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/order-confirmation
  def order-confirmation
    Notification.order-confirmation
  end

end
