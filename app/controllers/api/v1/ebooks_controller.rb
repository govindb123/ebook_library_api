module Api
  module V1
    class EbooksController < ApplicationController
      def index
        ebooks = Ebook.order(created_at: :desc)

        data = ebooks.map do |ebook|
          EbookSerializer.new(ebook).as_json
        end
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
          "Ebook fetched successfully"
        )
      end


      private

      def ebook_params
        params.permit(:title,:author,:file,:cover)
      end

    end
  end


end