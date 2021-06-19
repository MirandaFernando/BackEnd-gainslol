require "rails_helper"

RSpec.describe BetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/bets").to route_to("bets#index")
    end

    it "routes to #show" do
      expect(get: "/bets/1").to route_to("bets#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/bets").to route_to("bets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/bets/1").to route_to("bets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/bets/1").to route_to("bets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/bets/1").to route_to("bets#destroy", id: "1")
    end
  end
end
