require "rails_helper"

RSpec.describe CarritosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/carritos").to route_to("carritos#index")
    end

    it "routes to #show" do
      expect(get: "/carritos/1").to route_to("carritos#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/carritos").to route_to("carritos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/carritos/1").to route_to("carritos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/carritos/1").to route_to("carritos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/carritos/1").to route_to("carritos#destroy", id: "1")
    end
  end
end
