require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'moviedatabase'
}

ActiveRecord::Base.establish_connection(options)
