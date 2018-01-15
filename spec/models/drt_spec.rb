require 'rails_helper'

RSpec.describe Drt, type: :model do
  it 'has a valid factory' do
    expect(build :drt).to be_valid
  end

  it 'validates presence of drt_hash' do
    should validate_presence_of(:drt_hash)
  end

  it 'allows pdf upload' do
    pdf = Dragonfly.app.fetch_file('./spec/assets/pdf-sample.pdf')
    should allow_value(pdf).for(:result_pdf)
  end

  describe 'invalid' do
    it 'is not valid without drt_hash' do
      expect(build(:drt, drt_hash: nil)).to be_invalid
    end

    it 'is not valid with .doc upload' do
      doc = Dragonfly.app.fetch_file('./spec/assets/TestWordDoc.doc')
      should_not allow_value(doc).for(:result_pdf)
    end
  end

  describe 'automatic state change' do
    before(:all) do
      @drt = create :drt
    end
    it 'should update status when applicant is assigned' do
      @drt.applicant_id = 1
      @drt.save
      expect(@drt.status).to eq('applicant_attached')
    end

    it 'should update status when result is uploaded' do
      @drt.result_pdf_uid = '12345'
      @drt.save
      expect(@drt.status).to eq('result_uploaded')
    end
  end
end
