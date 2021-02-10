class DealersController < ApplicationController
  def index
    if params[:param1] == "sort"
      @dealers = Dealer.sort_by_instruments
    elsif params[:search]
      @dealers = Dealer.search(params[:search])
      @dealers = Dealer.partial_search(params[:search])
    else
      @dealers = Dealer.order_by_created_at
    end
  end

  def show
    @dealer = Dealer.find(params[:id])
    @instruments = @dealer.instruments.count
  end

  def new
  end

  def create
    dealer = Dealer.new(dealer_params)
    if dealer.save
      redirect_to "/dealers"
    else
      flash[:notice] = "Dealer not created: Required information missing."
      render :new
    end
  end

  def edit
    @dealer = Dealer.find(params[:id])
  end

  def update
    dealer = Dealer.find(params[:id])
    dealer.update(dealer_params)
    dealer.save
    redirect_to "/dealers/#{dealer.id}"
  end

  def destroy
    dealer = Dealer.find(params[:id])
    dealer.destroy
    redirect_to "/dealers"
  end

  private

  def dealer_params
    params.permit(:name, :fully_staffed, :sq_ft, :city, :state, :search)
  end
end
