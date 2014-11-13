require 'sinatra'
require 'json'
require 'idobata'
require 'slim'
require 'uri'
require 'cgi'

Idobata.hook_url = ENV['HOOK_URL']

IDOBATA_HOST = 'idobata.io'

class App < Sinatra::Base
  post '/push.json' do
    data = JSON.parse request.body.read
    unless params[:cgi_escaped_url].nil?
      url = CGI.unescape(params[:cgi_escaped_url])
      if URI.parse(url).host == IDOBATA_HOST
        Idobata.hook_url = url
      end
    end
    Thread.new do
      if ENV['BRANCH'] == 'all' || data["ref"].match(/#{ENV['BRANCH']}/)
        message = Slim::Template.new("templates/push.slim").render(self, data: data)
        Idobata::Message.create source: message, format: :html if message
      end
    end

    { status: "ok" }.to_json
  end
end
