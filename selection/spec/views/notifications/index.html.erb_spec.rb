require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :headline => "Headline",
        :content => "MyText"
      ),
      Notification.create!(
        :headline => "Headline",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => "Headline".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
