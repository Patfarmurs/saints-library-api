class Shelf < ApplicationRecord
  has_many :books

  validates :description, presence: true, uniqueness: { case_sensitive: false }
end
