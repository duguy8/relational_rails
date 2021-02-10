class DealerInstrumentsController < ApplicationController
  def instruments
    @dealer = Dealer.find(params[:id])
    if !params[:param1].nil?
      @instruments = @dealer.instruments.order_by_name
    elsif params[:amount].nil?
      @instruments = @dealer.instruments
    else
      amount = params[:amount].to_i
      @instruments = @dealer.instruments.filter_price(amount)
    end
  end

  def new_instrument
    @dealer = Dealer.find(params[:id])
  end

  def create_instrument
    dealer = Dealer.find(params[:id])
    instruments = dealer.instruments
    new = instruments.create(instrument_params)
    if new.save
      redirect_to "/dealers/#{dealer.id}/instruments"
    else
      flash[:notice] = "Instrument not created: Required information missing."
      redirect_to "/dealers/#{dealer.id}/instruments/new"
    end
  end

  private
  
  def instrument_params
    params.permit(:name, :on_sale, :brand, :price)
  end
end
