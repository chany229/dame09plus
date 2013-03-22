# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "admin/articles/index" do
  before(:each) do
    assign(:articles, [
      stub_model(Article),
      stub_model(Article)
    ])
  end

  it "renders a list of admin/articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
