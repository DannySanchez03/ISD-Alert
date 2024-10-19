require "rails_helper"

RSpec.describe StudentAttencancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/student_attendancescances").to route_to("student_attendancescances#index")
    end

    it "routes to #new" do
      expect(get: "/student_attendancescances/new").to route_to("student_attendancescances#new")
    end

    it "routes to #show" do
      expect(get: "/student_attendancescances/1").to route_to("student_attendancescances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/student_attendancescances/1/edit").to route_to("student_attendancescances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/student_attendancescances").to route_to("student_attendancescances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/student_attendancescances/1").to route_to("student_attendancescances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/student_attendancescances/1").to route_to("student_attendancescances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/student_attendancescances/1").to route_to("student_attendancescances#destroy", id: "1")
    end
  end
end
