require 'viewpoint'
require 'time'
include Viewpoint::EWS

class WelcomeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default
    today = Date.today
    redirect_to(
      action: 'index',
      slug: 'concert_hall',
      year: today.year,
      month: today.month
    )
  end

  def index
    #room = ExchangeClientService.find_room(params[:slug].to_sym)
    @events = []
  end

  private

  def get_client
    ExchangeClientService.client
  end

  def get_calendar
    #client = get_client

    #calendar = client.get_folder(:calendar, opts = {act_as: "tomtg-hall@infotech.com"})
    #calendar = client.get_folder(:calendar)
  end

  # def get_availability
  #   client = get_client
  #
  #   # Find when a user is busy
  #   start_time = DateTime.parse("2017-05-01").iso8601
  #   end_time = DateTime.parse("2017-05-12").iso8601
  #   user_free_busy = client.get_user_availability(['tomtg-hall@infotech.com'],
  #     start_time: start_time,
  #     end_time:   end_time,
  #     requested_view: :free_busy)
  #   busy_times = user_free_busy.calendar_event_array
  # end


  # def get_folders
  #   client = get_client
  #
  #   client.folders
  # end

end