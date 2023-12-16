class Book < ApplicationRecord
  belongs_to :author
  belongs_to :shelf

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
