require 'rails_helper'

RSpec.describe "administrators/show", type: :view do
  before(:each) do
    assign(:administrator, Administrator.create!(
      name: "Name",
      school_name: "School Name",
      administrator_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/School Name/)
    expect(rendered).to match(/2/)
  end
end
