require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :title => "MyString",
      :content => "MyText",
      :locked? => false,
      :course => nil
    ))
  end

  it "renders the edit lesson form" do
    render

    assert_select "form[action=?][method=?]", lesson_path(@lesson), "post" do

      assert_select "input#lesson_title[name=?]", "lesson[title]"

      assert_select "textarea#lesson_content[name=?]", "lesson[content]"

      assert_select "input#lesson_locked?[name=?]", "lesson[locked?]"

      assert_select "input#lesson_course_id[name=?]", "lesson[course_id]"
    end
  end
end
