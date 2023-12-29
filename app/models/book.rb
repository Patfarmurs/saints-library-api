class Book < ApplicationRecord
  belongs_to :author
  belongs_to :shelf

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :author, presence: true, uniqueness: true
  validates :body, presence: true, uniqueness: true
end
