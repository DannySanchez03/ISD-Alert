require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      name: "MyString",
      student_id: 1,
      class_period: 1,
      teacher: nil
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[name]"

      assert_select "input[name=?]", "student[student_id]"

      assert_select "input[name=?]", "student[class_period]"

      assert_select "input[name=?]", "student[teacher_id]"
    end
  end
end
