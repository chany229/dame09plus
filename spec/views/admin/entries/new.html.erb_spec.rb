require 'spec_helper'

describe "admin/entries/new" do
  before(:each) do
    assign(:admin_entry, stub_model(Admin::Entry,
      :body => "MyString"
    ).as_new_record)
  end

  it "renders new admin_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_entries_path, :method => "post" do
      assert_select "input#admin_entry_body", :name => "admin_entry[body]"
    end
  end
end
