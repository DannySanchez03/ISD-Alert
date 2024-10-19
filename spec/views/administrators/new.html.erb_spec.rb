require 'rails_helper'

RSpec.describe "administrators/new", type: :view do
  before(:each) do
    assign(:administrator, Administrator.new(
      name: "MyString",
      school_name: "MyString",
      administrator_id: 1
    ))
  end

  it "renders new administrator form" do
    render

    assert_select "form[action=?][method=?]", administrators_path, "post" do

      assert_select "input[name=?]", "administrator[name]"

      assert_select "input[name=?]", "administrator[school_name]"

      assert_select "input[name=?]", "administrator[administrator_id]"
    end
  end
end
