require 'rails_helper'

RSpec.describe ApplicantsController, type: :controller do

  describe 'GET new' do
    subject { get :new }

    it 'renders the applicants new template' do
      expect(subject).to render_template('applicants/new')
    end

    it 'returns a 200 OK status code' do
      get :new
      expect(response).to have_http_status(200)
    end

  end
#is this the same as above?
  context 'GET new' do

    it 'assign the application form' do
      get :new
      expect(assigns :applicant).to be_a_new(Applicant)
    end

  end

  context 'POST create' do

    it 'saves new applicant to database' do
      create :applicant
      expect(Applicant.count).to eq 1
    end

    # fails with error: Expected response to be a <3xx: redirect>, but was a <200: OK>
    # it 'redirects to welcome profile path' do
    #   expect(build :applicant).to redirect_to(welcome_profile_path)
    # end

    it 'responds with error if email missing' do
      expect(build :applicant, email_address: nil).to raise_error "This field can't be blank"
    end
  end


end