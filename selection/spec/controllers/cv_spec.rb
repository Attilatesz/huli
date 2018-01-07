require 'rails_helper'

RSpec.describe CvsController, type: :controller do
  let(:user) { create(:user) }

describe 'GET new' do

  subject { get :new }
  it 'returns status code 200 and renderscv/new' do
    sign_in user
    get :new
    expect(response).to have_http_status(200)
    expect(subject).to render_template('cvs/new')
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

  subject { get :create}
  it 'it returns status code 302 and redirect to root' do
    cv = fixture_file_upload('pdf-sample.pdf', 'application/pdf')
    post :create, params: { cv: { cv: cv } }
    expect(response).to have_http_status(302)
    expect(response).to redirect_to('/')
    expect(controller).to set_flash[:success]
  end

  it 'increases the number of Cvs by one' do
    expect do
      cv = fixture_file_upload('pdf-sample.pdf', 'application/pdf')
      post :create, params: { cv: { cv: cv } }
    end.to change(Cv, :count).by(1)
  end

  it 'it returns status code 200 and reload page if the file format not valid' do
    sign_in user
    user.create_applicant(attributes_for(:applicant))
    cv = fixture_file_upload('TestWordDoc.doc', 'application/doc')
    post :create, params: { cv: { cv: cv } }
    expect(response).to have_http_status(200)
    expect(subject).to render_template('cvs/new')
  end
end

describe 'GET edit' do

  before(:each) do
    sign_in user
    user.create_applicant(attributes_for(:applicant))

  end
    subject { get :edit }
    it 'returns status code 200 and renders the cv/edit' do
      user.applicant.create_cv(attributes_for(:cv))
      get :edit
      expect(response).to have_http_status(200)
      expect(subject).to render_template('cvs/edit')
    end

    it 'returns status code 302 and redirect to cv/new without cv' do
      get :edit
      expect(response).to have_http_status(302)
      expect(response).to redirect_to ('/cv/new')
    end
  end
end
