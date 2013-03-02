require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :entry_id => 1,
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => articles_path, :method => "post" do
      assert_select "input#article_entry_id", :name => "article[entry_id]"
      assert_select "textarea#article_body", :name => "article[body]"
    end
  end
end
