require 'spec_helper'

describe "admin/articles/index" do
  before(:each) do
    assign(:admin_articles, [
      stub_model(Admin::Article),
      stub_model(Admin::Article)
    ])
  end

  it "renders a list of admin/articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
