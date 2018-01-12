require 'rails_helper'

RSpec.describe CvsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET new' do

    it 'returns status code 200 and renders cv/new' do
      sign_in user
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template('cvs/new')
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
      post :create, params: { cv: attributes_for(:cv, :pdf_upload) }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/')
      expect(controller).to set_flash[:success]
    end

    it 'increases the number of Cvs by one' do
      expect do
        post :create, params: { cv: attributes_for(:cv, :pdf_upload) }
      end.to change(Cv, :count).by(1)
    end

    it 'it returns status code 200 and reload page if the file format not valid' do
      sign_in user
      user.create_applicant(attributes_for(:applicant))
      post :create, params: { cv: attributes_for(:cv, :doc_upload) }
      expect(response).to render_template('cvs/new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET edit' do

    before(:each) do
      sign_in user
      user.create_applicant(attributes_for(:applicant))
    end

    it 'returns status code 200 and renders the cv/edit' do
      user.applicant.create_cv(attributes_for(:cv, :pdf))
      get :edit
      expect(response).to have_http_status(200)
      expect(response).to render_template('cvs/edit')
    end

    it 'returns status code 302 and redirect to cv/new without cv' do
      get :edit
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/cv/new')
    end
  end

  describe 'PUT update' do

    before(:each) do
      sign_in user
      user.create_applicant(attributes_for(:applicant))
      user.applicant.create_cv(attributes_for(:cv, :pdf))
    end

    it 'it returns status code 302 and redirect to root' do
      put :update, params: { cv: attributes_for(:cv, :pdf_upload) }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/')
      expect(controller).to set_flash[:success]
    end

    it "allows cv to be updated" do
      created = user.applicant.cv.cv_uid
      put :update, params: { cv: attributes_for(:cv, :pdf2_upload) }
      user.applicant.cv.reload
      expect(user.applicant.cv.cv_uid).not_to eq(created)
    end
  end
end
