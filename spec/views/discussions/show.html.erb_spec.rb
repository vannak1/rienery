require 'rails_helper'

RSpec.describe "discussions/show", type: :view do
  before(:each) do
    @discussion = assign(:discussion, Discussion.create!(
      :question => "Question"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question/)
  end
end
