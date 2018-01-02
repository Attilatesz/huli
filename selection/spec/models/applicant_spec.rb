require 'rails_helper'


RSpec.describe Applicant, type: :model do
  it 'has a valid factory' do
    expect(create :applicant).to be_valid
  end

  describe 'invalid' do
    it 'when no email present' do
      expect(build :applicant, email: nil).to be_invalid
    end
  end
end