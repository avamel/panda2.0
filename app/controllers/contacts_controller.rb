class ContactsController < ApplicationController
  def index
    # @newest_tours = Tour.last(3)
    @newest_tours = Tour.take(3)
  end
end
