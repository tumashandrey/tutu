class Train < ActiveRecord::Base
  has_many :tickets
  belongs_to :route
end
