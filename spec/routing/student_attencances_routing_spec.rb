require "rails_helper"

RSpec.describe StudentAttencancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/student_attencances").to route_to("student_attencances#index")
    end

    it "routes to #new" do
      expect(get: "/student_attencances/new").to route_to("student_attencances#new")
    end

    it "routes to #show" do
      expect(get: "/student_attencances/1").to route_to("student_attencances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/student_attencances/1/edit").to route_to("student_attencances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/student_attencances").to route_to("student_attencances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/student_attencances/1").to route_to("student_attencances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/student_attencances/1").to route_to("student_attencances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/student_attencances/1").to route_to("student_attencances#destroy", id: "1")
    end
  end
end
