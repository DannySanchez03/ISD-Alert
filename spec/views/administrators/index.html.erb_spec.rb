require 'rails_helper'

RSpec.describe "administrators/index", type: :view do
  before(:each) do
    assign(:administrators, [
      Administrator.create!(
        name: "Name",
        school_name: "School Name",
        administrator_id: 2
      ),
      Administrator.create!(
        name: "Name",
        school_name: "School Name",
        administrator_id: 2
      )
    ])
  end

  it "renders a list of administrators" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("School Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
