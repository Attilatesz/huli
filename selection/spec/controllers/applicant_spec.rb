require 'rails_helper'

RSpec.describe ApplicantsController, type: :controller do

  context 'GET new' do

    it 'creates a new applicant' do
      get :new
      expect(assigns(:applicant)).to be_a_new(Applicant)
    end
  end
end