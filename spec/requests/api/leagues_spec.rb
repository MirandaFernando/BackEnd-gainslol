require 'rails_helper'


RSpec.describe "/leagues", type: :request do
  let!(:name) {:team}
  let(:valid_attributes) {
    {name: name}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      get api_leagues_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      league = League.create! valid_attributes
      get api_league_url(league), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new League" do
        expect {
          post api_leagues_url,
               params: { league: valid_attributes }, headers: valid_headers, as: :json
        }.to change(League, :count).by(1)
      end

      it "renders a JSON response with the new league" do
        post api_leagues_url,
             params: { league: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new League" do
        expect {
          post api_leagues_url,
               params: { league: invalid_attributes }, as: :json
        }.to change(League, :count).by(0)
      end

      it "renders a JSON response with errors for the new league" do
        post api_leagues_url,
             params: { league: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_name){ 'LCK' }
      let(:new_attributes) {
        {name: new_name}
      }

      it "updates the requested league" do
        league = League.create! valid_attributes
        patch api_league_url(league),
              params: { league: new_attributes }, headers: valid_headers, as: :json
        league.reload
        expect(league.name).to eq(new_name)
      end

      it "renders a JSON response with the league" do
        league = League.create! valid_attributes
        patch api_league_url(league),
              params: { league: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the league" do
        league = League.create! valid_attributes
        patch api_league_url(league),
              params: { league: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested league" do
      league = League.create! valid_attributes
      expect {
        delete api_league_url(league), headers: valid_headers, as: :json
      }.to change(League, :count).by(-1)
    end
  end
end
