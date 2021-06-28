require 'rails_helper'

RSpec.describe "/bets", type: :request do
  let(:user) { create :user}
  let(:bet) { create :bet, user: user}
  let(:bet_two) { create :bet, user: create(:user)}

  let(:valid_attributes) { attributes_for :bet, user: user }
  let(:invalid_attributes) { attributes_for :invalid_bet, user: user }

  let(:valid_headers) { user.create_new_auth_token }

  let(:invalid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_bets_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it 'renders two bets from distinct users' do
      bet
      bet_two
      get api_bets_url, headers: valid_headers, as: :json
      expect(json_response.size).to eq 1
      expect(json_response[0][:id]).to eq bet.id
    end

    it_behaves_like 'user not logged in' do
      let(:url) { get api_bets_url, headers: invalid_headers, as: :json }
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_bet_url(bet), headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it_behaves_like "trying to access another user's resource" do
      let(:url) do
        get api_bet_url(bet_two), headers: valid_headers, as: :json
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        get api_bet_url(bet), headers: invalid_headers, as: :json
      end
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Bet' do
        expect do
          post api_bets_url,
               params: { bet: valid_attributes },
               headers: valid_headers,
               as: :json
        end.to change(Bet, :count).by(1)
      end

      it 'renders a JSON response with the new bet' do
        post api_bets_url,
             params: { bet: valid_attributes },
             headers: valid_headers,
             as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Bet' do
        expect do
          post api_bets_url,
               params: { bet: invalid_attributes },
               headers: valid_headers,
               as: :json
        end.to change(Bet, :count).by(0)
      end

      it 'renders a JSON response with errors for the new bet' do
        post api_bets_url,
             params: { bet: invalid_attributes },
             headers: valid_headers,
             as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        post api_bets_url,
             params: { bet: valid_attributes },
             headers: invalid_headers,
             as: :json
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for :bet }

      it 'updates the requested bet' do
        patch api_bet_url(bet),
              params: { bet: new_attributes },
              headers: valid_headers,
              as: :json
        bet.reload
        expect(bet.input ).to eq(new_attributes[:input ])
      end

      it 'renders a JSON response with the bet' do
        patch api_bet_url(bet),
              params: { bet: new_attributes },
              headers: valid_headers,
              as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the bet' do
        patch api_bet_url(bet),
              params: { bet: invalid_attributes },
              headers: valid_headers,
              as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    it_behaves_like "trying to access another user's resource" do
      let(:url) do
        patch api_bet_url(bet_two), headers: valid_headers, as: :json
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        patch api_bet_url(bet),
              params: { bet: valid_attributes },
              headers: invalid_headers,
              as: :json
      end
    end

  end

  describe 'DELETE /destroy' do
    it 'destroys the requested bet' do
      bet
      expect do
        delete api_bet_url(bet), headers: valid_headers, as: :json
      end.to change(Bet, :count).by(-1)
    end

    it_behaves_like "trying to access another user's resource" do
      let(:url) do
        delete api_bet_url(bet_two), headers: valid_headers, as: :json
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        delete api_bet_url(bet), headers: invalid_headers, as: :json
      end
    end
  end

end

  