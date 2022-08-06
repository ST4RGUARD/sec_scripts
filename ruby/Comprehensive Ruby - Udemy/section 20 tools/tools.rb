# tools
require 'yaml'

user = {
  name: 'Kristine',
  favorites: {
    food: 'Pizza',
    movies: 'Fiddler'
  }
}

user[:name]
user[:favorites][:food]
user.dig(:name)
user.dig(:favorites, :movies)
user.dig(:favorites, :not_exist)

# config = YAML.load('config.yml')
# config.dig('key')
# require 'image_optimizer'
# ImageOptimizer.new('file.jpg', quality: 25).optimize
