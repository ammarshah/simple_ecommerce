FactoryGirl.define do
  factory :order_line do
    qty 1
    unit_price 1.5
    total_price 1.5
    product nil
    order nil
  end
end
