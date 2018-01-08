require 'rails_helper'

RSpec.describe ProfilePicturesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET new' do

    it 'returns status code 200 and renders profile_picture/new' do
      sign_in user
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template('profile_pictures/new')
    end

    it 'returns status code 302 and redirect to root without user' do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/')
    end
  end

  describe 'POST create' do

    before(:each) do
      sign_in user
      user.create_applicant(attributes_for(:applicant))
    end

    it 'it returns status code 302 and redirect to root' do
      test_image = fixture_file_upload('girl2.jpeg', 'application/jpeg')
      post :create, params: { profile_picture: { image: test_image } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/')
      expect(controller).to set_flash[:success]
    end

    it 'increases the number of Profile pictures by one' do
      expect do
      test_image = fixture_file_upload('girl2.jpeg', 'application/jpeg')
      post :create, params: { profile_picture: { image: test_image } }
      end.to change(ProfilePicture, :count).by(1)
    end

    it 'it returns status code 200 and reload page if the file format not valid' do
      sign_in user
      user.create_applicant(attributes_for(:applicant))
      test_file = fixture_file_upload('TestWordDoc.doc', 'application/doc')
      post :create, params: { profile_picture: { image: test_file } }
      expect(response).to render_template('profile_pictures/new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET edit' do

    before(:each) do
      sign_in user
      user.create_applicant(attributes_for(:applicant))
    end

    it 'returns status code 200 and renders the profile_picture/edit' do
      user.applicant.create_profile_picture(attributes_for(:profile_picture))
      get :edit
      expect(response).to have_http_status(200)
      expect(response).to render_template('profile_pictures/edit')
    end

    it 'returns status code 302 and redirect to profile/new without image' do
      get :edit
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/profile_picture/new')
    end
  end

  describe 'PUT update' do

    before(:each) do
      sign_in user
      user.create_applicant(attributes_for(:applicant))
      user.applicant.create_profile_picture(attributes_for(:profile_picture))
    end

    it 'it returns status code 302 and redirect to root' do
      test_image = fixture_file_upload('girl2.jpeg', 'application/jpeg')
      put :update, params: { profile_picture: { image: test_image} }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/')
      expect(controller).to set_flash[:success]
    end

    it "allows pp to be updated" do
      created = user.applicant.profile_picture.image_uid
      puts created.inspect
      test_image1 = fixture_file_upload('girl2.jpeg', 'application/jpeg')
      put :update, params: { profile_picture: { image: test_image1 } }
      user.applicant.profile_picture.reload
      expect(user.applicant.profile_picture.image_uid).not_to eq(created)
      puts user.applicant.profile_picture.image_uid.inspect
    end
  end
end
