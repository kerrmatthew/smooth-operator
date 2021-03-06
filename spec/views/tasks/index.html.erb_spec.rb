require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :name => "Name",
        :project_id => 1,
        :assignee_id => 2,
        :assigner_id => 3,
        :status => "Status"
      ),
      stub_model(Task,
        :name => "Name",
        :project_id => 1,
        :assignee_id => 2,
        :assigner_id => 3,
        :status => "Status"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
