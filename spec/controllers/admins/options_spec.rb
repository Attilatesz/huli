require 'rails_helper'

RSpec.describe Admins::OptionsController, type: :controller do
  let! (:admin) {create :user, admin: true}
  let! (:user) {create :user, admin: false}
  let! (:option) {create :option}


  describe 'POST options' do

    context 'with admin rights' do

      it 'respond with status 302 and not raises error' do
        sign_in admin
        post :create, params: { option: attributes_for(:option), category: option.category}
        expect(response.status).to eq(302)
        expect(controller).not_to set_flash[:danger].to match("Authentication error!")
      end
    end

    context 'without admin rights' do

      it 'respond with status 302 flashes "Authentication error!" and redirects to root' do
        sign_in user
        post :create, params: { option: attributes_for(:option)}
        expect(response.status).to eq(302)
        expect(controller).to set_flash[:danger].to match("Authentication error!")
        expect(response).to redirect_to('/')
      end
    end

  end

  describe 'DELETE options' do

    context 'with admin rights' do

      it 'respond with status 302 and not raises error' do
        sign_in admin
        post :destroy, params: { category: option.category, id: option.id}
        expect(response.status).to eq(302)
        expect(controller).not_to set_flash[:danger].to match("Authentication error!")
      end
    end

    context 'without admin rights' do

      it 'respond with status 302 flashes "Authentication error!" and redirects to root' do
        sign_in user
        post :destroy, params: { category: option.category, id: option.id}
        expect(response.status).to eq(302)
        expect(controller).to set_flash[:danger].to match("Authentication error!")
        expect(response).to redirect_to('/')
      end
    end

  end
end
