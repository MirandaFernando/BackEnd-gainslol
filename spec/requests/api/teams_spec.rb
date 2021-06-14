require 'rails_helper'


RSpec.describe "/teams", type: :request do
  let!(:league) { create :league }
  let!(:team) { create :team, league: league }
  
  let(:valid_attributes) {
    {name: Faker::Esport.team, league_id: league.id}
  }

  let(:invalid_attributes) {
    {name: nil, league_id: league.id}
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      get api_teams_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_team_url(team), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Team" do
        expect {
          post api_teams_url,
               params: { team: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Team, :count).by(1)
      end

      it "renders a JSON response with the new team" do
        post api_teams_url,
             params: { team: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Team" do
        expect {
          post api_teams_url,
               params: { team: invalid_attributes }, as: :json
        }.to change(Team, :count).by(0)
      end

      it "renders a JSON response with errors for the new team" do
        post api_teams_url,
             params: { team: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name:Faker::Esport.team}
      }

      it "updates the requested team" do
        patch api_team_url(team),
              params: { team: new_attributes }, headers: valid_headers, as: :json
        team.reload
        expect(team.name).to eq(new_attributes[:name])
      end

      it "renders a JSON response with the team" do
        patch api_team_url(team),
              params: { team: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the team" do
        patch api_team_url(team),
              params: { team: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested team" do
      expect {
        delete api_team_url(team), headers: valid_headers, as: :json
      }.to change(Team, :count).by(-1)
    end
  end
end
