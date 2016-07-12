require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      :title => "MyString",
      :content => "MyText",
      :locked? => false,
      :course => nil
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do

      assert_select "input#lesson_title[name=?]", "lesson[title]"

      assert_select "textarea#lesson_content[name=?]", "lesson[content]"

      assert_select "input#lesson_locked?[name=?]", "lesson[locked?]"

      assert_select "input#lesson_course_id[name=?]", "lesson[course_id]"
    end
  end
end
