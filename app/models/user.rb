class User < ApplicationRecord
  before_validation :normalize_name, on: :create
  after_validation :set_location, on: [:create,:update]

  def normalize_name
    self.name = name.downcase.titleize
  end
  def set_location
    self.location = LocationService.query(self)
  end

  after_initialize do |user|
    puts "You have initialized an user!"
  end
  after_find do |user|
    puts "You have found an user!"
  end
end