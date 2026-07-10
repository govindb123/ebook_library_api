class Ebook < ApplicationRecord
  has_one_attached :file
  has_one_attached :cover

  validates :title, presence: true
  validates :author, presence: true
  validates :file, presence: true

  validate :acceptable_file

  private

  def acceptable_file
    return unless file.attached?

    allowed_types = [ "application/pdf", "application/epub+zip"]

    unless allowed_types.include?(file.blob.content_type)
      errors.add(:file, "must be a PDF or EPUB")
    end

    if file.blob.byte_size > 25.megabytes
      errors.add(:file, "size should be less than 25MB")
    end
  end
end
