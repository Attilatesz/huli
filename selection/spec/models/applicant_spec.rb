require 'rails_helper'


RSpec.describe Applicant, type: :model do
  it 'has a valid factory' do
    expect(create :applicant).to be_valid
  end

  describe 'invalid' do
    it 'has no email present' do
      expect(build :applicant, email_address: nil).to be_invalid
    end
  end
end