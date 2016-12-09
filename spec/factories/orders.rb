FactoryGirl.define do
  factory :order do
    order_no "MyString"
    total 1.5
    date "2016-12-09"
    user nil
  end
end
