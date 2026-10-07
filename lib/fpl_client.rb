require_relative "fpl_client/client"

module FplClient
  def self.new
    Client.new
  end
end