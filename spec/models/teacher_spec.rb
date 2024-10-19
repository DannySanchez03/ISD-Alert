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
  end

  context "when email is invalid" do
    before do
      @teacher1 = Teacher.new(
        email: "bob",
        encrypted_password: "password123",
        name: "Bob",
        teacher_id: 123456,
        administrator_id: @admin.id
      )
    end

    it "should not be valid" do
      expect(@teacher1).to_not be_valid
      expect(@teacher1.errors[:email]).to include("must be a valid email address")
    end
  end

  context "when password is too short" do
    before do
      @teacher1 = Teacher.new(
        email: "bob@bob.com",
        encrypted_password: "passwo", # less than 8 characters
        name: "Bob",
        teacher_id: 123456,
        administrator_id: @admin.id
      )
    end

    it "should not be valid" do
      expect(@teacher1).to_not be_valid
      expect(@teacher1.errors[:encrypted_password]).to include("must be at least 8 characters long")
    end
  end

  context "when name is empty" do
    before do
      @teacher1 = Teacher.new(
        email: "bob@bob.com",
        encrypted_password: "password123",
        name: "",
        teacher_id: 123456,
        administrator_id: @admin.id
      )
    end

    it "should not be valid" do
      expect(@teacher1).to_not be_valid
      expect(@teacher1.errors[:name]).to include("a name is required")
    end
  end

  context "when teacher_id is invalid" do
    before do
      @teacher1 = Teacher.new(
        email: "bob@bob.com",
        encrypted_password: "password123",
        name: "Bob",
        teacher_id: 12345, # invalid as it should be >= 100000
        administrator_id: @admin.id
      )
    end

    it "should not be valid" do
      expect(@teacher1).to_not be_valid
      expect(@teacher1.errors[:teacher_id]).to include("must be an id within 100000-999999")
    end
  end

  context "when administrator_id is invalid" do
    before do
      @teacher1 = Teacher.new(
        email: "bob@bob.com",
        encrypted_password: "password123",
        name: "Bob",
        teacher_id: 123456,
        administrator_id: nil # no admin associated
      )
    end

    it "should not be valid" do
      expect(@teacher1).to_not be_valid
      expect(@teacher1.errors[:administrator]).to include("must exist")
    end
  end
end
