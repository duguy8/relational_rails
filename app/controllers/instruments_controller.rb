class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.where(on_sale: true)
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
