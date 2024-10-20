require 'rails_helper'

RSpec.describe "teachers/index", type: :view do
  before(:each) do
    assign(:teachers, [
      Teacher.create!(
        name: "Name",
        teacher_id: 2,
        administrator: nil
      ),
      Teacher.create!(
        name: "Name",
        teacher_id: 2,
        administrator: nil
      )
    ])
  end

  it "renders a list of teachers" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
