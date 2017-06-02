class BookingController < ApplicationController
  def index
    room = ExchangeClientService.find_room(params[:slug].to_sym)
    @events = ExchangeClientService.events(
      name: room[:name],
      year: Integer(params[:year]),
      month: Integer(params[:month])
    )
  end
end
