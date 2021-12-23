require 'uri'
require 'net/http'
require 'openssl'
require 'json'

url = URI("https://v3.football.api-sports.io/leagues")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'v3.football.api-sports.io'
request["x-rapidapi-key"] = '21156322e71ca970ba5b42583049c570'

response = http.request(request)
arr = JSON.parse(response.read_body)

ar = eval(arr["response"].to_s)
ar.map do |x|
  p x["league"]
end
#ar["league"]["name"].each do |x|
#puts x
#end