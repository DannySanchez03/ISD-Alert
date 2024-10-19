require 'rails_helper'

RSpec.describe "administrators/edit", type: :view do
  let(:administrator) {
    Administrator.create!(
      name: "MyString",
      school_name: "MyString",
      administrator_id: 1
    )
  }

  before(:each) do
    assign(:administrator, administrator)
  end

  it "renders the edit administrator form" do
    render

    assert_select "form[action=?][method=?]", administrator_path(administrator), "post" do

      assert_select "input[name=?]", "administrator[name]"

      assert_select "input[name=?]", "administrator[school_name]"

      assert_select "input[name=?]", "administrator[administrator_id]"
    end
  end
end
