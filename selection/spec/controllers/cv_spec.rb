require 'rails_helper'

RSpec.describe CvsController, type: :controller do
  let(:user) { create(:user) }

describe 'GET new' do

  it 'returns status code 200 if user signed in' do
    sign_in user
    get :new
    expect(response).to have_http_status(200)
  end

  subject { get :new }
  it 'renders the cv new if user signed in' do
    sign_in user
    expect(subject).to render_template('cvs/new')
  end

  it 'redirect to root without user' do
    get :new
    expect(response).to redirect_to ('/')
  end

  it 'returns status code 302 without user' do
    get :new
    expect(response).to have_http_status(302)
  end
end

describe 'POST create' do

  subject { get :create}

  it 'it returns status code 302 and redirect' do
    sign_in user
    user.create_applicant(attributes_for(:applicant))
    cv = fixture_file_upload('pdf-sample.pdf', 'application/pdf')
    post :create, params: { cv: { cv: cv } }
    expect(response).to have_http_status(302)
    expect(response).to redirect_to('/')
    expect(controller).to set_flash[:success]
  end

  it 'increases the number of Cv by one' do
    expect do
      sign_in user
      user.create_applicant(attributes_for(:applicant))
      cv = fixture_file_upload('pdf-sample.pdf', 'application/pdf')
      post :create, params: { cv: { cv: cv } }
    end.to change(Cv, :count).by(1)
  end

  it 'it returns status code 200 and reload page if the format not valid' do
    sign_in user
    user.create_applicant(attributes_for(:applicant))
    cv = fixture_file_upload('TestWordDoc.doc', 'application/doc')
    post :create, params: { cv: { cv: cv } }
    expect(response).to have_http_status(200)
    expect(subject).to render_template('cvs/new')
  end
end
end
