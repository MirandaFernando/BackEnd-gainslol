require "rails_helper"

RSpec.describe LeaguesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/leagues").to route_to("leagues#index")
    end

    it "routes to #show" do
      expect(get: "/leagues/1").to route_to("leagues#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/leagues").to route_to("leagues#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/leagues/1").to route_to("leagues#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/leagues/1").to route_to("leagues#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/leagues/1").to route_to("leagues#destroy", id: "1")
    end
  end
end
