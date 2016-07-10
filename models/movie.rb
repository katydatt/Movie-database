class Movie < ActiveRecord::Base
  has_many :details
end