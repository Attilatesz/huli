require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe 'GET #index' do
    subject { get :index }

    it 'renders the welcome index template' do
      expect(subject).to render_template('welcome/index')
    end

  end

end