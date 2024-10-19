require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  let(:student) {
    Student.create!(
      name: "MyString",
      student_id: 1,
      class_period: 1,
      teacher: nil
    )
  }

  before(:each) do
    assign(:student, student)
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(student), "post" do

      assert_select "input[name=?]", "student[name]"

      assert_select "input[name=?]", "student[student_id]"

      assert_select "input[name=?]", "student[class_period]"

      assert_select "input[name=?]", "student[teacher_id]"
    end
  end
end
