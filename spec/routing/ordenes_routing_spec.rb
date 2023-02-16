require "rails_helper"

RSpec.describe OrdenesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ordenes").to route_to("ordenes#index")
    end

    it "routes to #show" do
      expect(get: "/ordenes/1").to route_to("ordenes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ordenes").to route_to("ordenes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ordenes/1").to route_to("ordenes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ordenes/1").to route_to("ordenes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ordenes/1").to route_to("ordenes#destroy", id: "1")
    end
  end
end
