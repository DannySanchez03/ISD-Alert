require 'rails_helper'

RSpec.describe "teachers/show", type: :view do
  before(:each) do
    assign(:teacher, Teacher.create!(
      name: "Name",
      teacher_id: 2,
      administrator: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
