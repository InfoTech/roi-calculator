require 'viewpoint'
include Viewpoint::EWS

class EventsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def show
    # https://makandracards.com/makandra/27443-interacting-with-a-microsoft-exchange-server-from-ruby


    endpoint = 'https://webmail.infotech.com/ews/Exchange.asmx'
    user = Rails.application.secrets.exchange_username
    pass = Rails.application.secrets.exchange_password

    client = Viewpoint::EWSClient.new(endpoint, user, pass, http_opts: {ssl_verify_mode: 0})


    calendar = client.get_folder(:calendar)

    @events = []

    calendar.items.each do |item|
      #p item.subject
      #p item.required_attendees

      @events << item
    end


  end

end
