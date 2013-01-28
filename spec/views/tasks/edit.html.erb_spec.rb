require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :name => "MyString",
      :project_id => 1,
      :assignee_id => 1,
      :assigner_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path(@task), :method => "post" do
      assert_select "input#task_name", :name => "task[name]"
      assert_select "input#task_project_id", :name => "task[project_id]"
      assert_select "input#task_assignee_id", :name => "task[assignee_id]"
      assert_select "input#task_assigner_id", :name => "task[assigner_id]"
      assert_select "input#task_status", :name => "task[status]"
    end
  end
end
