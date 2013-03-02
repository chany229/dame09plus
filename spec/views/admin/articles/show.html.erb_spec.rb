require 'spec_helper'

describe "admin/articles/show" do
  before(:each) do
    @admin_article = assign(:admin_article, stub_model(Admin::Article))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
