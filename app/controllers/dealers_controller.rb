class DealersController < ApplicationController
  def index
    @dealers = Dealer.all.order(created_at: :desc)
  end

  def instruments
    @dealer = Dealer.find(params[:id])
    @instruments = @dealer.instruments
  end

  def show
    @dealer = Dealer.find(params[:id])
    @instruments = @dealer.instruments.count
  end

  def new
  end

  def create
    dealer = Dealer.new({
      name: params[:dealer][:name],
      fully_staffed: params[:dealer][:fully_staffed],
      sq_ft: params[:dealer][:sq_ft],
      city: params[:dealer][:city],
      state: params[:dealer][:state]
      })

      dealer.save
      redirect_to '/dealers'
  end

  def edit
    @dealer = Dealer.find(params[:id])
  end

  def update
    dealer = Dealer.find(params[:id])
    dealer.update({
      name: params[:dealer][:name],
      fully_staffed: params[:dealer][:fully_staffed],
      sq_ft: params[:dealer][:sq_ft],
      city: params[:dealer][:city],
      state: params[:dealer][:state]
      })

    dealer.save
    redirect_to "/dealers/#{dealer.id}"
  end

  def destroy
    dealer = Dealer.find(params[:id])
    dealer.destroy

    redirect_to '/dealers'
  end

  def new_instrument
    @dealer = Dealer.find(params[:id])
  end

  def create_instrument
    dealer = Dealer.find(params[:id])
    instruments = dealer.instruments
    new = instruments.create!(
      name: params[:instrument][:name],
      on_sale: params[:instrument][:on_sale],
      brand: params[:instrument][:brand],
      price: params[:instrument][:price]
    )
    new.save
    redirect_to "/dealers/#{dealer.id}/instruments"
  end
end
