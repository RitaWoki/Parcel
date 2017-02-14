require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/cost') do
  flat_rate = params.fetch('flat_rate')
  width = params.fetch('width')
  height = params.fetch('height')
  length = params.fetch('length')
  weight = params.fetch('weight')
  distance = params.fetch('distance')
  speed = params.fetch('speed')
  wrapping = params.fetch('wrapping')
  @parcel = Parcel.new(flat_rate, width, height, length, weight, distance, speed, wrapping)
  @cost = @parcel.cost_to_ship()
  erb(:cost)
end
