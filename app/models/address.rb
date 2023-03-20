class Address < ApplicationRecord
  belongs_to :person
  validates :street, presence: true
  validates :town, presence: true
  validates :zip, presence: true
end
