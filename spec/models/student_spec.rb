require 'rails_helper'
#Happy Paths
RSpec.describe Student, type: :model do
  before do
    # Create an Administrator first and ensure it's created successfully
    @admin = Administrator.create(id: 111222, name: "Admin Name")
    puts @admin.errors.full_messages unless @admin.persisted?  # Debugging

    @teacher = Teacher.create(
      email: "bob@bob.com",
      encrypted_password: "password123",
      name: "Bob",
      teacher_id: 123456,
      administrator_id: @admin.id
    )

    @student1 = Student.create(
      email: "dakiti@yahoo.com",
      encrypted_password: "passwors",
      class_period:1,
      name: "Jumpa",
      student_id: 654321,
      teacher_id: @teacher.id
    )
  end

  it "should expect a student account email to be valid" do
    expect(@student1.email).to eq("dakiti@yahoo.com")
  end

  it "should expect a student account password to be valid" do
    expect(@student1.encrypted_password).to eq("passwors")
  end

  it "should expect a student account class period to be valid" do
    expect(@student1.class_period).to eq(1)
  end

  it "should expect a student account name to be valid" do
    expect(@student1.name).to eq("Jumpa")
  end

  it "should expect a student account student id to be valid" do
    expect(@student1.student_id).to eq(654321)
  end

  it "should expect a student account teacher id to be valid" do
    expect(@student1.teacher_id).to eq(@teacher.id)
  end

  it "should expect a student account to be valid" do
    expect(@student1).to be_valid
  end
end

#Sad Paths
RSpec.describe Student, type: :model do
  before do
    # Create an Administrator first and ensure it's created successfully
    @admin = Administrator.create(id: 111222, name: "Admin Name")
    puts @admin.errors.full_messages unless @admin.persisted?  # Debugging

    @teacher = Teacher.create(
      email: "bob@bob.com",
      encrypted_password: "password123",
      name: "Bob",
      teacher_id: 123456,
      administrator_id: @admin.id
    )

    @student1 = Student.create(
      email: "dakiticom",
      encrypted_password: "passwors",
      class_period:1,
      name: "Jumpa",
      student_id: 654321,
      teacher_id: @teacher.id
    )
  end

  it "should not be valid" do
    expect(@student1).to_not be_valid
    expect(@student1.errors[:email]).to include("must be a valid email address")
  end

  context "when password is too short" do
    before do
      @student1 = Student.new(
        email: "dakiti@yahoo.com",
        encrypted_password: "passwor", # less than 8 characters
        class_period:1,
        name: "Jumpa",
        student_id: 654321,
        teacher_id: @teacher.id
      )
    end

    it "should not be valid" do
      expect(@student1).to_not be_valid
      expect(@student1.errors[:encrypted_password]).to include("must be at least 8 characters long")
    end
  end

  context "when name is empty" do
    before do
      @student1 = Student.new(
        email: "dakiti@yahoo.com",
        encrypted_password: "passwor",
        class_period:1,
        name: "",
        student_id: 654321,
        teacher_id: @teacher.id
      )
    end

    it "should not be valid" do
      expect(@student1).to_not be_valid
      expect(@student1.errors[:name]).to include("a name is required")
    end
  end

  context "when student_id is invalid" do
    before do
      @student1 = Student.new(
        email: "dakiti@yahoo.com",
        encrypted_password: "passwor",
        class_period:1,
        name: "Jumpa",
        student_id: 65432, # invalid as it should be >= 100000
        teacher_id: @teacher.id
      )
    end

    it "should not be valid" do
      expect(@student1).to_not be_valid
      expect(@student1.errors[:student_id]).to include("must be an id within 100000-999999")
    end
  end

  context "when teacher_id is invalid" do
    before do
      @student1 = Student.new(
        email: "dakiti@yahoo.com",
        encrypted_password: "passwor",
        class_period:1,
        name: "Jumpa",
        student_id: 65432,
        teacher_id: nil # no admin associated
      )
    end

    it "should not be valid" do
      expect(@student1).to_not be_valid
      expect(@student1.errors[:teacher]).to include("must exist")
    end
  end
end
