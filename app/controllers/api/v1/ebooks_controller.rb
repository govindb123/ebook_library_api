module Api
  module V1
    class EbooksController < ApplicationController
      def index
        ebooks = Ebook.order(created_at: :desc)

        success_response(
          ebooks.as_json(
            only: %i[id title author created_at]
          ),
          "Ebooks fetched successfully"
        )
      end

      def create
        ebook = Ebook.new(ebook_params)

        if ebook.save
          success_response(
            ebook.as_json(only: %i[id title author created_at]),
            "Ebook uploaded successfully",
            :created
          )
        else
          error_response(
            "Validation failed",
            ebook.errors.full_messages
          )
        end
      end


      private

      def ebook_params
        params.permit(:title,:author,:file,:cover)
      end

    end
  end


end