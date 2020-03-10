require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should validate name' do
      record = User.new
      record.name = "Yiqi Zhang"
      expect(record.name).to be_present
    end
    it 'should validate username' do
      record = User.new
      record.email = "test@test.com"
      expect(record.email).to be_present
    end
    it 'username should be unique' do
      User.create(:email=>"test@test.com", :password=>"hey")
      record = User.new(:email=>"test@test.com", :password=>"hi")
      record.should_not be_valid   
      record.errors[:email].should include("has already been taken")   
    end
    # it 'password must have minimum length on creation' do
    #   record = User.new(:email=>"test@test.com", :password_digest=>"hi")
    #   record.should_not be_valid   
    #   record.errors[:password_digest].should include("minimum length")   
    # end
  end
  describe '.authenticate_with_credentials' do
    it 'should authenticate with valid credentials' do
    User.create(:email => "test2@test.com", :password => "workingpassword")

    @user = User.authenticate_with_credentials("test2@test.com", "workingpassword")
    expect(@user).to be_truthy
    end
    it 'should be case insensitive' do
      User.create(:email => "test20@test.com", :password => "workingpassword")
      @user = User.authenticate_with_credentials("TEST20@test.com", "workingpassword")
      expect(@user).to be_truthy
    end
    it 'should disregard white spaces' do
      User.create(:email => " test20@test.com ", :password => "workingpassword")
      @user = User.authenticate_with_credentials("test20@test.com", "workingpassword")
      expect(@user).to be_truthy
    end

  end
end
