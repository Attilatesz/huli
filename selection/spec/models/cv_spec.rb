require 'rails_helper'

RSpec.describe Cv, type: :model do
  it 'is valid with uploaded cv' do
    cv = build :cv
    expect(cv).to be_valid
  end
end