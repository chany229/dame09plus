require 'spec_helper'

describe "admin/articles/show" do
  before(:each) do
    @article = assign(:article, stub_model(Article))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
