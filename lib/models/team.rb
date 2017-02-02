require 'active_record'

class Team < ActiveRecord::Base
  validates :name, :division, presence: true
  has_many :players
end
