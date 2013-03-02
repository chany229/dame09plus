require 'spec_helper'

describe "entries/index" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
        :body => "Body"
      ),
      stub_model(Entry,
        :body => "Body"
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
