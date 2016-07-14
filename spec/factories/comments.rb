FactoryGirl.define do
  factory :comment do
    commenter "MyString"
    body "MyText"
    discussion nil
  end
end
