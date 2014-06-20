FactoryGirl.define do
  factory :post do
    title 'Lorem ipsum'

    before(:create) do |post, evaluator|
      if evaluator.writer.nil? and evaluator.author.nil?
        evaluator.writer = 'Ernest Hemingway'
      end
    end
  end
end
