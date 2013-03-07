require 'spec_helper'

describe "admin/articles/new" do
  before(:each) do
    assign(:article, stub_model(Article).as_new_record)
  end

  it "renders new admin_article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_articles_path, :method => "post" do
    end
  end
end
