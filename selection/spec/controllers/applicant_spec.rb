require 'rails_helper'

RSpec.describe ApplicantsController, type: :controller do
  let! (:user) {create :user}

  describe 'GET new' do

    subject { get :new }
    it 'renders the applicants new template' do
      expect(subject).to render_template('applicants/new')
    end

    it 'returns a 200 OK status code' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'assign a new applicant' do
      get :new
      expect(assigns :applicant).to be_a_new(Applicant)
    end
  end

  describe 'POST applicants' do

    context 'with valid attributes' do

      it 'increases the number of applicant by one' do
        expect do
          sign_in user
          post :create, params: { applicant: attributes_for(:applicant)}
        end.to change(Applicant, :count).by(1)
      end

      it 'responds with 302 and redirects to welcome profile path' do
        sign_in user
        post :create, params: { applicant: attributes_for(:applicant)}
        expect(response.status).to eq(302)
        expect(response).to redirect_to('/')
      end
    end

    context 'with invalid attributes' do

      it 'responds with 200 and renders the form again' do
        sign_in user
        post :create, params: { applicant: {email_address: 'edesanna@hotmail.com'}}
        expect(response.status).to eq(200)
        expect(response).to render_template('applicants/new')
      end
    end

      it 'does not increases the number of applicant' do
        expect do
          sign_in user
          post :create, params: { applicant: {first_name: "Edes"}}
        end.not_to change(Applicant, :count)
      end

  end

end
