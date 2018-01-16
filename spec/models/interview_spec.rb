require 'rails_helper'

RSpec.describe Interview, type: :model do
  describe 'valid' do
    it 'has a valid factory' do
      expect(build :interview).to be_valid
    end
  end

  describe 'invalid' do
    it 'has no interviewer given' do
      expect(build :interview, interviewer: nil).to be_invalid
    end

    it 'has no start time given' do
      expect(build :interview, start: nil).to be_invalid
    end
  end
end
