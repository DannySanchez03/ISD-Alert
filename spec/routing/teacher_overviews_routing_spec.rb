require "rails_helper"

RSpec.describe TeacherOverviewsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/teacher_overviews").to route_to("teacher_overviews#index")
    end

    it "routes to #new" do
      expect(get: "/teacher_overviews/new").to route_to("teacher_overviews#new")
    end

    it "routes to #show" do
      expect(get: "/teacher_overviews/1").to route_to("teacher_overviews#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/teacher_overviews/1/edit").to route_to("teacher_overviews#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/teacher_overviews").to route_to("teacher_overviews#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/teacher_overviews/1").to route_to("teacher_overviews#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/teacher_overviews/1").to route_to("teacher_overviews#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/teacher_overviews/1").to route_to("teacher_overviews#destroy", id: "1")
    end
  end
end
