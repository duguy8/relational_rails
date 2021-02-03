class DealersController < ApplicationController
  def index
    @dealers = Dealer.all
  end

  def show
    @dealer = Dealer.find(params[:id])
  end
  
  def new

  end
end
