require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    assign(:student, Student.create!(
      name: "Name",
      student_id: 2,
      class_period: 3,
      teacher: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
