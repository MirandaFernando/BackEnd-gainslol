require 'rails_helper'


RSpec.describe "/teams", type: :request do

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
      Team.create! valid_attributes
      get teams_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      team = Team.create! valid_attributes
      get team_url(team), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Team" do
        expect {
          post teams_url,
               params: { team: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Team, :count).by(1)
      end

      it "renders a JSON response with the new team" do
        post teams_url,
             params: { team: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Team" do
        expect {
          post teams_url,
               params: { team: invalid_attributes }, as: :json
        }.to change(Team, :count).by(0)
      end

      it "renders a JSON response with errors for the new team" do
        post teams_url,
             params: { team: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested team" do
        team = Team.create! valid_attributes
        patch team_url(team),
              params: { team: new_attributes }, headers: valid_headers, as: :json
        team.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the team" do
        team = Team.create! valid_attributes
        patch team_url(team),
              params: { team: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the team" do
        team = Team.create! valid_attributes
        patch team_url(team),
              params: { team: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested team" do
      team = Team.create! valid_attributes
      expect {
        delete team_url(team), headers: valid_headers, as: :json
      }.to change(Team, :count).by(-1)
    end
  end
end
