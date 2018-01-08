require 'rails_helper'

RSpec.describe ProfilePicturesController, type: :controller do
  let(:user) { create(:user) }

describe 'GET new' do

  subject { get :new }
  it 'returns status code 200 and renders profile_picture/new' do
    sign_in user
    get :new
    expect(response).to have_http_status(200)
    expect(subject).to render_template('profile_pictures/new')
  end

  it 'returns status code 302 and redirect to root without user' do
    get :new
    expect(response).to have_http_status(302)
    expect(response).to redirect_to('/')
  end
end
end
