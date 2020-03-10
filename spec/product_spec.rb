require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate name' do
      record = Product.new
      record.name = "AirPods"
      expect(record.name).to be_present
    end
    it 'should validate name' do
      record = Product.new
      record.price = 250
      expect(record.price).to be_present
    end
    it 'should validate name' do
      record = Product.new
      record.quantity = 1000000
      expect(record.quantity).to be_present
    end
    it 'should validate name' do
      record = Product.new
      record.category_id = 1
      expect(record.category_id).to be_present
    end
  end
end