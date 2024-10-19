require 'rails_helper'

RSpec.describe "teachers/new", type: :view do
  before(:each) do
    assign(:teacher, Teacher.new(
      name: "MyString",
      teacher_id: 1,
      administrator: nil
    ))
  end

  it "renders new teacher form" do
    render

    assert_select "form[action=?][method=?]", teachers_path, "post" do

      assert_select "input[name=?]", "teacher[name]"

      assert_select "input[name=?]", "teacher[teacher_id]"

      assert_select "input[name=?]", "teacher[administrator_id]"
    end
  end
end
