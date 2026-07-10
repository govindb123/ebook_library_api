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

      
    end
  end
end