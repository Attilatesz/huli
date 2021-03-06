require 'rails_helper'

RSpec.describe ProfilePicture, type: :model do
  it 'has valid factory' do
    profile_picture = build :profile_picture, :image
    expect(profile_picture).to be_valid
  end

  it do
    should validate_presence_of(:image).with_message('Please upload a file')
  end

  it do
    should belong_to(:applicant)
  end

  it do
    jpg = Dragonfly.app.fetch_file('./spec/assets/girl1.jpg')
    jpeg = Dragonfly.app.fetch_file('./spec/assets/girl2.jpeg')
    png = Dragonfly.app.fetch_file('./spec/assets/boy1.png')
    should allow_values(jpg, jpeg, png).for(:image)
  end

  describe 'invalid' do
    it 'is not valid without applicant' do
      expect(build :profile_picture, applicant: nil).to be_invalid
    end

    it'is not valid without image' do
      expect(build :profile_picture, image: nil).to be_invalid
    end

    it do
      bmp = Dragonfly.app.fetch_file('./spec/assets/boy2.bmp')
      should_not allow_value(bmp).for(:image)
    end

  end
end
