module Api
  module V1
    class EbooksController < ApplicationController

      def index
        ebooks = Ebook
                  .includes(file_attachment: :blob, cover_attachment: :blob)
                  .order(created_at: :desc)

        data = ebooks.map { |ebook| EbookSerializer.new(ebook).as_json }

        success_response(data, "Ebooks fetched successfully")
      end
 
      def create
        ebook = Ebook.new(ebook_params)

        if ebook.save
          success_response( EbookSerializer.new(ebook).as_json,
            "Ebook uploaded successfully",:created)
        else
          error_response( "Validation failed", ebook.errors.full_messages)
        end
      end

      def show
        ebook = Ebook.find(params[:id])

        success_response(
          EbookSerializer.new(ebook).as_json,
          "Ebook fetched successfully")
      end

      def search
        query = params[:q].to_s.strip.downcase

        ebooks = Ebook.joins(file_attachment: :blob)
                      .where( "LOWER(ebooks.title) LIKE :query OR LOWER(ebooks.author) LIKE :query
                       OR LOWER(active_storage_blobs.filename) LIKE :query",
                        query: "%#{query}%"
                      )

        data = ebooks.map { |ebook| EbookSerializer.new(ebook).as_json }
        success_response(data, "Search completed successfully")
      end

      def destroy
        ebook = Ebook.find(params[:id])
        ebook.destroy
        success_response(nil, "Ebook deleted successfully")
      end

      def download
        ebook = Ebook.find(params[:id])

        redirect_to rails_blob_path( ebook.file, disposition: "attachment", only_path: true)
      end

      private

      def ebook_params
        params.permit(:title,:author,:file,:cover)
      end

    end
  end

end