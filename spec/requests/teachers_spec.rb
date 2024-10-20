require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.


RSpec.describe "/teachers", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Teacher. As you add validations to Teacher, be sure to
  # adjust the attributes here as well.
  let(:admin) { Administrator.create!(name: "Admin Name", id: 122334) }
  let(:valid_attributes) { { email: "bob@bob.com", encrypted_password: "password123", name: "Bob", teacher_id: 123456, administrator_id: admin.id } }
  let(:invalid_attributes) { { email: "", encrypted_password: "", name: "", teacher_id: nil, administrator_id: nil } }


  describe "GET /index" do
    it "renders a successful response" do
      Teacher.create! valid_attributes
      get teachers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      teacher = Teacher.create! valid_attributes
      get teacher_url(teacher)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_teacher_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      teacher = Teacher.create! valid_attributes
      get edit_teacher_url(teacher)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Teacher" do
        expect {
          post teachers_url, params: { teacher: valid_attributes }
          puts Teacher.last&.errors.full_messages # Add this line to debug
        }.to change(Teacher, :count).by(1)
      end

      it "redirects to the created teacher" do
        post teachers_url, params: { teacher: valid_attributes }
        expect(response).to redirect_to(teacher_url(Teacher.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Teacher" do
        expect {
          post teachers_url, params: { teacher: invalid_attributes }
        }.to change(Teacher, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post teachers_url, params: { teacher: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {valid_attributes}

      it "updates the requested teacher" do
        teacher = Teacher.create!(valid_attributes)
        patch teacher_url(teacher), params: { teacher: new_attributes }
        teacher.reload
        expect(teacher.name).to eq("Bob") # Add assertion for updated state
      end

      it "redirects to the teacher" do
        teacher = Teacher.create! valid_attributes
        patch teacher_url(teacher), params: { teacher: new_attributes }
        teacher.reload
        expect(response).to redirect_to(teacher_url(teacher))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        teacher = Teacher.create! valid_attributes
        patch teacher_url(teacher), params: { teacher: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested teacher" do
      teacher = Teacher.create! valid_attributes
      expect {
        delete teacher_url(teacher)
      }.to change(Teacher, :count).by(-1)
    end

    it "redirects to the teachers list" do
      teacher = Teacher.create! valid_attributes
      delete teacher_url(teacher)
      expect(response).to redirect_to(teachers_url)
    end
  end
end
