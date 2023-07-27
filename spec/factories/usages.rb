FactoryBot.define do
  factory :usage do
    # Define any attributes necessary for the Usage model
    association :dispenser, factory: :dispenser
    tap_opened_at { Time.now - 1.minute }
    tap_closed_at { Time.now }
  end
end