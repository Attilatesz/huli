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

  it do
    pdf = Dragonfly.app.fetch_file('./spec/assets/pdf-sample.pdf')
    should allow_value(pdf).for(:cv)
  end

  describe 'invalid' do
    it 'is not valid without applicant' do
      expect(build :cv, applicant: nil).to be_invalid
    end

    it'is not valid without cv' do
      expect(build :cv, cv: nil).to be_invalid
    end

    it do
      doc = Dragonfly.app.fetch_file('./spec/assets/TestWordDoc.doc')
      should_not allow_value(doc).for(:cv)
    end

  end
end
