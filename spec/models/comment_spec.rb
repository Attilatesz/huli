require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'valid' do
    it 'has a valid factory' do
      expect(build :user).to be_valid
    end
  end

  describe 'invalid' do
    it 'has no commenter given' do
      expect(build :comment, commenter: nil).to be_invalid
    end

    it 'has no text body given' do
      expect(build :comment, body: nil).to be_invalid
    end
  end
end
