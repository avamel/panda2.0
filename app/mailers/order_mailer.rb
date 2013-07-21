class OrderMailer < AsyncMailer
  default :to => FeedContact.email_feeds.map(&:text),
          :from => "notification@panda-travel.by"

  def send_mail(order_id)
    @order = Order.find(order_id)
    @tour = @order.tour
    mail(:subject => "Новый заказ номер #{@order.id}")
  end
end