require 'rails_helper'

RSpec.describe Interview, type: :model do
  describe 'valid' do
    it 'has a valid factory' do
      expect(build :interview).to be_valid
    end
  end

  describe 'invalid' do
    it 'has no appplicant attached' do
      expect(build :interview, applicant: nil).to be_invalid
    end
  end

  describe 'automatic state change' do
    before(:all) do
      @interview = create :interview
    end

    it 'should update status when interview is scheduled' do
      @interview.applicant_id = 1
      @interview.save
      expect(@interview.status).to eq('scheduled')
    end
  end
end
