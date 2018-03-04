require 'sinatra'
require 'httparty'
require 'nokogiri'


get '/' do


url = "https://miami.craigslist.org/search/#{params[:job]}"
response = HTTParty.get url
html = response.body
dom = Nokogiri::HTML(html)
links = dom.css("a.hdrlnk")

links.map do |link|
    '<h3>' + link.to_str + " " + link['href'] + '<h3>'
  end
end
