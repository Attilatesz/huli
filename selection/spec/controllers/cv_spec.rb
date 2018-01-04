require 'rails_helper'

RSpec.describe CvsController, type: :controller do
  describe "#create" do
    it "creates a cv" do
      expect(Cv).to receive(:create)
      get :create
    end
  end
end