class DealersController < ApplicationController
  def index
    @dealers = Dealer.all
  end
  #
  # def show
  #   @dealers = Dealer.find(params[:id])
  # end
  #
  # def new
  #
  # end
end
