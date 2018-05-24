FactoryBot.define do
  factory :post do
    title 'Lorem ipsum'
    comments { FactoryBot.build_list :comment, 5 }

    trait :trait do
      title 'Title changed by trait'
    end
  end
end
