require 'active_record'

class Player < ActiveRecord::Base
  validates :name, :position, presence: true
  belongs_to :team
end
