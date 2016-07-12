require 'rails_helper'

RSpec.describe "discussions/new", type: :view do
  before(:each) do
    assign(:discussion, Discussion.new(
      :question => "MyString"
    ))
  end

  it "renders new discussion form" do
    render

    assert_select "form[action=?][method=?]", discussions_path, "post" do

      assert_select "input#discussion_question[name=?]", "discussion[question]"
    end
  end
end
