require 'rails_helper'


RSpec.describe "/leagues", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      League.create! valid_attributes
      get leagues_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      league = League.create! valid_attributes
      get league_url(league), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new League" do
        expect {
          post leagues_url,
               params: { league: valid_attributes }, headers: valid_headers, as: :json
        }.to change(League, :count).by(1)
      end

      it "renders a JSON response with the new league" do
        post leagues_url,
             params: { league: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new League" do
        expect {
          post leagues_url,
               params: { league: invalid_attributes }, as: :json
        }.to change(League, :count).by(0)
      end

      it "renders a JSON response with errors for the new league" do
        post leagues_url,
             params: { league: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested league" do
        league = League.create! valid_attributes
        patch league_url(league),
              params: { league: new_attributes }, headers: valid_headers, as: :json
        league.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the league" do
        league = League.create! valid_attributes
        patch league_url(league),
              params: { league: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the league" do
        league = League.create! valid_attributes
        patch league_url(league),
              params: { league: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested league" do
      league = League.create! valid_attributes
      expect {
        delete league_url(league), headers: valid_headers, as: :json
      }.to change(League, :count).by(-1)
    end
  end
end
