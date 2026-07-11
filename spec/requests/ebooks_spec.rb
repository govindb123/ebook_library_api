require 'rails_helper'

RSpec.describe "Api::V1::Ebooks", type: :request do

  describe "GET /api/v1/ebooks" do

    it "returns all ebooks" do

      create_list(:ebook, 3)

      get "/api/v1/ebooks"
      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body["success"]).to eq(true)
      expect(body["data"].count).to eq(3)

    end

  end

  describe "POST /api/v1/ebooks" do

    it "uploads ebook" do

      pdf = fixture_file_upload(
        Rails.root.join("spec/fixtures/files/sample.pdf"),
        "application/pdf"
      )

      post "/api/v1/ebooks",
        params: { title: "Ruby", author: "Govind", file: pdf }
      expect(response).to have_http_status(:created)
      body = JSON.parse(response.body)
      expect(body["success"]).to eq(true)

    end

  end

  describe "DELETE /api/v1/ebooks/:id" do

    it "deletes ebook" do

      ebook = create(:ebook)

      delete "/api/v1/ebooks/#{ebook.id}"

      expect(response).to have_http_status(:ok)

      expect(Ebook.count).to eq(0)

    end

  end

  describe "GET /search" do

    it "searches ebook" do

      create(:ebook, title: "Ruby Guide")

      get "/api/v1/ebooks/search?q=ruby"

      body = JSON.parse(response.body)

      expect(body["data"].length).to eq(1)

    end

  end

  describe "GET /show" do

    it "returns ebook" do

      ebook = create(:ebook)

      get "/api/v1/ebooks/#{ebook.id}"

      expect(response).to have_http_status(:ok)

    end

  end

  describe "GET /download" do

    it "downloads pdf" do

      ebook = create(:ebook)

      get "/api/v1/ebooks/#{ebook.id}/download"

      expect(response).to have_http_status(302)
    end

  end

  describe "Validation" do

    it "fails without title" do

      pdf = fixture_file_upload(
        Rails.root.join("spec/fixtures/files/sample.pdf"),
        "application/pdf"
      )

      post "/api/v1/ebooks",
        params: {
          author: "Govind",
          file: pdf
        }

      expect(response).to have_http_status(:unprocessable_entity)

    end

  end

  
end