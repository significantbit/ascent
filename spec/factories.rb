# coding: utf-8
FactoryGirl.define do
  factory :ascent_node, class: Ascent::Node do
    sequence(:name) { |n| "route#{n}" }

    trait :root do
      # Fix due to closure_tree bug
      to_create { |instance| instance.save(validate: false) }
    end
  end
  factory :test_block do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:content) do |n|
      <<-EOF
        Lorém --#{n}-- ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
        reprehenderit in voluptate velit esse cillum dolore eu fugiat
        nulla pariatur. Excepteur sint occaecat cupidatat non proident,
        sunt in culpa qui officia deserunt mollit anim id est laborum."
      EOF
    end
  end
end
