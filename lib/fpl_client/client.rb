require 'httparty'

module FplClient
  class Client
    include HTTParty
    base_uri 'https://fantasy.premierleague.com/api'
    headers 'User-Agent' => 'Mozilla/5.0'

    def bootstrap
      get('/bootstrap-static/')
    end

    def fixtures(event: nil)
      endpoint = event ? "/fixtures/?event=#{event}" : '/fixtures/'
      get(endpoint)
    end

    def player_summary(player_id)
      get("/element-summary/#{player_id}/")
    end

    private

    def get(path)
      response = self.class.get(path)
      raise "API Error: #{response.code}" unless response.success?
      response.parsed_response
    end
  end
end