require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "Name",
      :owner_id => 1,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Status/)
  end
end
