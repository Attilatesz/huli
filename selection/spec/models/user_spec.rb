require 'rails_helper'


RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(create :user).to be_valid
  end

  # describe 'invalid' do
  #   it 'has no email present' do
  #     expect(build :user, email: nil).to be_invalid
  #   end

end

