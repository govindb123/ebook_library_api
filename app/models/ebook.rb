class Ebook < ApplicationRecord
  has_one_attached :file
  has_one_attached :cover

  validates :title, presence: true
  validates :author, presence: true
  validates :file, presence: true
end
