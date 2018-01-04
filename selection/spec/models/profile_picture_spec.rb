require 'rails_helper'

RSpec.describe ProfilePicture, type: :model do
  it 'has valid factory' do
    profile_picture = build :profile_picture
    expect(profile_picture).to be_valid
  end
end