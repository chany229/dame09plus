require 'spec_helper'

describe "admin/entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :body => "MyString"
    ).as_new_record)
  end

  it "renders new admin_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_entries_path, :method => "post" do
      assert_select "input#entry_body", :name => "entry[body]"
    end
  end
end
