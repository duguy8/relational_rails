class InstrumentsController < ApplicationController
  def index
    if params[:search]
      @instruments = Instrument.search(params[:search])
      if @instruments.empty?
        @instruments = Instrument.partial_search(params[:search])
      end
    else
      @instruments = Instrument.all_on_sale
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    instrument = Instrument.find(params[:id])
    instrument.update(instrument_params)
    instrument.save
    redirect_to "/instruments/#{instrument.id}"
  end

  def destroy
    instrument = Instrument.find(params[:id])
    dealer = instrument.dealer
    instrument.destroy
    redirect_to "/dealers/#{dealer.id}/instruments"
  end

  private

  def instrument_params
    params.permit(:name, :on_sale, :brand, :price)
  end
end
