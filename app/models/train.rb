class Train < ActiveRecord::Base
  has_many :tickets
  has_many :wagons
  belongs_to :route
end
