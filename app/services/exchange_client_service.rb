class ExchangeClientService
  class << self
    def client
      endpoint = 'https://webmail.infotech.com/ews/Exchange.asmx'
      user = Rails.application.secrets.exchange_username
      pass = Rails.application.secrets.exchange_password
      Viewpoint::EWSClient.new(endpoint, user, pass, http_opts: {ssl_verify_mode: 0})
    end
  end
end
