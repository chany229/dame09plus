# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "admin/entries/edit" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :body => "MyString"
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_entries_path(@entry), :method => "post" do
      assert_select "input#entry_body", :name => "entry[body]"
    end
  end
end
