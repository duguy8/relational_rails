class InstrumentsController < ApplicationController
  def index
    if params[:search]
      @instruments = Instrument.search(params[:search])
      @instruments = Instrument.partial_search(params[:search])
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
    instrument.update({
      name: params[:instrument][:name],
      on_sale: params[:instrument][:on_sale],
      brand: params[:instrument][:brand],
      price: params[:instrument][:price]
      })

    instrument.save
    redirect_to "/instruments/#{instrument.id}"
  end

  def destroy
    instrument = Instrument.find(params[:id])
    instrument.destroy

    redirect_to '/instruments'
  end
end
