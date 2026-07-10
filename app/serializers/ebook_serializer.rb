class EbookSerializer
  include Rails.application.routes.url_helpers

  def initialize(ebook)
    @ebook = ebook
  end

  def as_json
    {
      id: @ebook.id,
      title: @ebook.title,
      author: @ebook.author,
      file_name: @ebook.file.filename.to_s,
      file_type: @ebook.file.content_type,
      file_size: @ebook.file.byte_size,
      uploaded_at: @ebook.created_at,
      file_url: rails_blob_url(@ebook.file, only_path: true),
      cover_url: cover_url
    }
  end

  private

  def cover_url
    return nil unless @ebook.cover.attached?

    rails_blob_url(@ebook.cover, only_path: true)
  end
  
end