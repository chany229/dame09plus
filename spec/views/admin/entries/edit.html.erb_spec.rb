require 'spec_helper'

describe "admin/entries/edit" do
  before(:each) do
    @admin_entry = assign(:admin_entry, stub_model(Admin::Entry,
      :body => "MyString"
    ))
  end

  it "renders the edit admin_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_entries_path(@admin_entry), :method => "post" do
      assert_select "input#admin_entry_body", :name => "admin_entry[body]"
    end
  end
end
