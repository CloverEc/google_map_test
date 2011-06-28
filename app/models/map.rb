  #! ruby Ks
class Map
require 'json'
require 'net/http'
  
def self.geocode(address)
    begin 
       address = URI.encode(address)
       hash = Hash.new
       baseUrl = "http://maps.google.com/maps/api/geocode/json"
       reqUrl = "#{baseUrl}?address=#{address}&sensor=false&language=ja"
       response = Net::HTTP.get_response(URI.parse(reqUrl))
       status = JSON.parse(response.body)
      
       hash['lat'] = status['results'][0]['geometry']['location']['lat']
       hash['lng'] = status['results'][0]['geometry']['location']['lng']
      
       return hash
    rescue
       hash['lat'] = 0
       hash['lng'] = 0
       return hash
    end
   end 
end