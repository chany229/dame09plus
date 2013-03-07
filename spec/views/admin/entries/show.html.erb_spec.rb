require 'spec_helper'

describe "admin/entries/show" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :body => "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Body/)
  end
end
