require 'rails_helper'

RSpec.describe Admins::ApplicantsController, type: :controller do
  let! (:admin) {create :user, admin: true}
  let! (:user) {create :user, admin: false}
  let! (:applicant) {create :applicant}

  describe 'GET dashboard' do

    context 'with admin rights' do

      it 'respond with status 200' do
        sign_in admin
        get :dashboard
        expect(response.status).to eq(200)
      end
    end

    context 'without admin rights' do

      it 'respond with status 302 flashes "Authentication error!" and redirects to root' do
        sign_in user
        get :dashboard
        expect(response.status).to eq(302)
        expect(controller).to set_flash[:danger].to match("Authentication error!")
        expect(response).to redirect_to('/')
      end
    end

  end

  describe 'GET applicant by id' do

    context 'with admin rights' do
      it 'respond with status 200 and displays applicant details' do
        sign_in admin
        get :show, params: { id: applicant.id }
        expect(response.status).to eq(200)
      end
    end

    context 'without admin rights' do

      it 'respond with status 302 flashes "Authentication error!" and redirects to root' do
        sign_in user
        get :show, params: { id: applicant.id }
        expect(response.status).to eq(302)
        expect(controller).to set_flash[:danger].to match("Authentication error!")
        expect(response).to redirect_to('/')
      end
    end

  end

end
