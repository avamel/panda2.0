class OrdersController < ApplicationController

  def new
    @tour = Tour.find params[:tour_id]
    @order = Order.new
    respond_to do |format|
      format.js { }
    end
  end

  def create
    @tour = Tour.find params[:tour_id]
    @order = @tour.orders.new order_params
    @email_feeds = FeedContact.email_feeds

    respond_to do |format|
      if @order.save
        format.js { render :action => "success" }
        OrderMailer.send_mail(@order.id).deliver if @email_feeds.present?
        # count_orders(@tour.id)
      else
        format.js { render :action => "new" }
      end
    end
  end

  def show
  end

  private
    def order_params
      params.require(:order).permit(:title, :email, :phone, :notation)
    end

    def count_orders(tour_id)
      Tour.increment_counter(:orders_count, tour_id)
    end
end