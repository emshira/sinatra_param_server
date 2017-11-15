require 'sinatra'
require 'httparty'
require 'nokogiri'



# get '/' do
#
#
# url = "https://miami.craigslist.org/search/sof"
# response = HTTParty.get url
# html = response.body
# dom = Nokogiri::HTML(html)
# links = dom.css("a.hdrlnk")
#
# links.map do |link|
#     '<h3>' + link.to_str + " " + link['href'] + '<h3>'
#   end
# end






# part 2:Make it possible to use query string parameters to request the jobs list for any type of job on Craigslist. For example, if I visit localhost:4567/?job=sof your server should display the list of software jobs.

# params {}
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
