FactoryGirl.define do
  factory :lesson do
    title "MyString"
    content "MyText"
    locked? false
    course nil
  end
end
