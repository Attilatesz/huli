require 'rails_helper'

RSpec.describe Cv, type: :model do
  it 'has valid factory' do
    cv = build :cv
    expect(cv).to be_valid
  end
  describe 'invalid' do
    it 'is not valid without applicant' do
      expect(build :cv, applicant: nil).to be_invalid
    end
    it'is not valid without cv' do
      expect(build :cv, cv: nil).to be_invalid
    end
  end
end