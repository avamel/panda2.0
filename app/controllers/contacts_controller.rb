class ContactsController < ApplicationController
  def index
    @newest_tours = Tour.last(9).sample(3)
  end
end
