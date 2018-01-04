require 'rails_helper'

RSpec.describe Cv, type: :model do
  it 'has valid factory' do
    cv = build :cv
    expect(cv).to be_valid
  end
  it do
    should validate_presence_of(:cv).with_message('Please upload a file')
  end
  it do
    should belong_to(:applicant)
  end
  describe 'invalid' do
    it 'is not valid without applicant' do
      expect(build :cv, applicant: nil).to be_invalid
    end
    it'is not valid without cv' do
      expect(build :cv, cv: nil).to be_invalid
    end
    it do
      should_not allow_values('test.jpg', 'test.doc').for(:cv)
    end
    it do
      should_not allow_value('test.pdf').for(:cv)
    end
  end
end
