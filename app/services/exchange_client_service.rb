class ExchangeClientService
  ROOMS = [
    { slug: :concert_hall, name: 'Fake Concert Hall Calendar' },
    { slug: :red_room, name: 'Fake Red Room Calendar' }
  ]
  class << self
    def client
      endpoint = 'https://webmail.infotech.com/ews/Exchange.asmx'
      user = Rails.application.secrets.exchange_username
      pass = Rails.application.secrets.exchange_password
      Viewpoint::EWSClient.new(endpoint, user, pass, http_opts: {ssl_verify_mode: 0})
    end

    def events(slug: nil, name: nil, year: nil, month: nil)
      raise 'Either slug or name is required' unless slug || name

      calendar = slug ? client.get_folder(slug) : client.get_folder_by_name(name)
      if year && month
        items = calendar.items_between(*DateLib.date_range(year: year, month: month))
      else
        items = calendar.items
      end
      items.reject(&:cancelled?)
    end

    def find_room(slug)
      ROOMS.find { |r| r[:slug] == slug }
    end
  end
end
