class Shelf < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :description, presence: true, uniqueness: { case_sensitive: false }
end
