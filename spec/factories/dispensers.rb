FactoryBot.define do
  factory :dispenser do
    # Define attributes for the Dispenser model
    flow_volume { 1.5 }
    price_per_liter { 2.0 }
    # Add any other attributes as needed
  end
end