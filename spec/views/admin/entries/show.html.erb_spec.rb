require 'spec_helper'

describe "admin/entries/show" do
  before(:each) do
    @admin_entry = assign(:admin_entry, stub_model(Admin::Entry,
      :body => "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Body/)
  end
end
