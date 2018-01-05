require 'rails_helper'

RSpec.describe Applicant, type: :model do
  it 'has a valid factory' do
    expect(build :applicant).to be_valid
  end

  describe 'invalid' do
    it 'has no email present' do
      expect(build :applicant, email_address: nil).to be_invalid
    end
    it 'has no first name present' do
      expect(build :applicant, first_name: nil).to be_invalid
    end
    it 'has no last name present' do
      expect(build :applicant, last_name: nil).to be_invalid
    end
    it 'has no phone number present' do
      expect(build :applicant, phone_number: nil).to be_invalid
    end
    it 'has no highest education present' do
      expect(build :applicant, highest_education: nil).to be_invalid
    end
    it 'has no english knowledge present' do
      expect(build :applicant, english_knowledge: nil).to be_invalid
    end
    it 'has no english class present' do
      expect(build :applicant, english_class: nil).to be_invalid
    end
    it 'has no payment option present' do
      expect(build :applicant, payment_option: nil).to be_invalid
    end
  end
end
