require 'rails_helper'
#Happy Paths
RSpec.describe Teacher, type: :model do
  before do
    # Create an Administrator first and ensure it's created successfully
    @admin = Administrator.create(id: 111222, name: "Admin Name")
    puts @admin.errors.full_messages unless @admin.persisted?  # Debugging

    @teacher1 = Teacher.create(
      email: "bob@bob.com",
      encrypted_password: "password123",
      name: "Bob",
      teacher_id: 123456,
      administrator_id: @admin.id
    )
  end

  it "should expect a teacher account email to be valid" do
    expect(@teacher1.email).to eq("bob@bob.com")
  end

  it "should expect a teacher account password to be valid" do
    expect(@teacher1.encrypted_password).to eq("password123")
  end

  it "should expect a teacher account name to be valid" do
    expect(@teacher1.name).to eq("Bob")
  end

  it "should expect a teacher account teacher id to be valid" do
    expect(@teacher1.teacher_id).to eq(123456)
  end

  it "should expect a teacher account admin id to be valid" do
    expect(@teacher1.administrator_id).to eq(@admin.id)
  end

  it "should expect a teacher account to be valid" do
    expect(@teacher1).to be_valid
  end
end

#Sad Paths
RSpec.describe Teacher, type: :model do
  before do
    # Create an Administrator first and ensure it's created successfully
    @admin = Administrator.create(id: 111222, name: "Admin Name")
    puts @admin.errors.full_messages unless @admin.persisted?  # Debugging

    @teacher1 = Teacher.create(
      email: "bob",
      encrypted_password: "password123",
      name: "Bob",
      teacher_id: 123456,
      administrator_id: @admin.id
    )
  end

  it "should expect a teacher account email to not be valid" do
    expect(@teacher1.email).to_not be_valid
  end
end

RSpec.describe Teacher, type: :model do
  before do
    # Create an Administrator first and ensure it's created successfully
    @admin = Administrator.create(id: 111222, name: "Admin Name")
    puts @admin.errors.full_messages unless @admin.persisted?  # Debugging

    @teacher1 = Teacher.create(
      email: "bob@bob.com",
      encrypted_password: "passwo",
      name: "Bob",
      teacher_id: 123456,
      administrator_id: @admin.id
    )
  end

  it "should expect a teacher account password to not be valid" do
    expect(@teacher1.encrypted_password).to_not be_valid
  end

end
RSpec.describe Teacher, type: :model do
  before do
    # Create an Administrator first and ensure it's created successfully
    @admin = Administrator.create(id: 111222, name: "Admin Name")
    puts @admin.errors.full_messages unless @admin.persisted?  # Debugging

    @teacher1 = Teacher.create(
      email: "bob@bob.com",
      encrypted_password: "password123",
      name: "",
      teacher_id: 123456,
      administrator_id: @admin.id
    )
  end

  it "should expect a teacher account name to not be valid" do
    expect(@teacher1.name).to_not be_valid
  end
end

RSpec.describe Teacher, type: :model do
  before do
    # Create an Administrator first and ensure it's created successfully
    @admin = Administrator.create(id: 111222, name: "Admin Name")
    puts @admin.errors.full_messages unless @admin.persisted?  # Debugging

    @teacher1 = Teacher.create(
      email: "bob@bob.com",
      encrypted_password: "password123",
      name: "Bob",
      teacher_id: 12345,
      administrator_id: @admin.id
    )
  end

  it "should expect a teacher account teacher id to not be valid" do
    expect(@teacher1.teacher_id).to_not be_valid
  end
end

RSpec.describe Teacher, type: :model do
  before do
    # Create an Administrator first and ensure it's created successfully
    @admin = Administrator.create(id: 11122, name: "Admin Name")
    puts @admin.errors.full_messages unless @admin.persisted?  # Debugging

    @teacher1 = Teacher.create(
      email: "bob@bob.com",
      encrypted_password: "password123",
      name: "Bob",
      teacher_id: 12345,
      administrator_id: @admin.id
    )
  end

  it "should expect a teacher account admin id to not be valid" do
    expect(@teacher1.administrator_id).to_not be_valid
  end
end