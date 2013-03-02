require 'spec_helper'

describe "admin/articles/edit" do
  before(:each) do
    @admin_article = assign(:admin_article, stub_model(Admin::Article))
  end

  it "renders the edit admin_article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_articles_path(@admin_article), :method => "post" do
    end
  end
end
