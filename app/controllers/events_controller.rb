require 'viewpoint'
include Viewpoint::EWS

class EventsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def index
    calendar = get_calendar
    @folders = get_folders


    @events = []

    calendar.items.each do |item|
      #p item.subject
      #p item.required_attendees

      @events << item
    end
  end

  def create

  end

  private
  def get_calendar
    # https://makandracards.com/makandra/27443-interacting-with-a-microsoft-exchange-server-from-ruby
    endpoint = 'https://webmail.infotech.com/ews/Exchange.asmx'
    user = Rails.application.secrets.exchange_username
    pass = Rails.application.secrets.exchange_password

    client = Viewpoint::EWSClient.new(endpoint, user, pass, http_opts: {ssl_verify_mode: 0})

    # calendar = client.get_folder(:calendar, opts = {act_as: "tomtg-hall@infotech.com"})
    calendar = client.get_folder(:calendar)
  end

  def get_folders
    endpoint = 'https://webmail.infotech.com/ews/Exchange.asmx'
    user = Rails.application.secrets.exchange_username
    pass = Rails.application.secrets.exchange_password

    client = Viewpoint::EWSClient.new(endpoint, user, pass, http_opts: {ssl_verify_mode: 0})

    client.folders
  end

end
