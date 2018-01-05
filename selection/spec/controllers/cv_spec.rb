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
    expect(response).to redirect_to '/'
  end

  it 'returns status code 302 without user' do
    get :new
    expect(response).to have_http_status(302)
  end
end
end
