require 'rails_helper'

RSpec.describe Usage, type: :model do
  let(:dispenser) { FactoryBot.create(:dispenser) } # Use build to create a non-persistent instance

  describe 'calculate_total_time' do
    it 'calculates the total time correctly' do
      usage = FactoryBot.create(:usage, dispenser: dispenser) # Use build to create a non-persistent instance
      usage.tap_opened_at = Time.now - 2.minutes
      usage.tap_closed_at = Time.now
      expect(usage.calculate_total_time).to eq(120) # 2 minutes in seconds
    end

    it 'returns nil when tap is not closed' do
      usage = FactoryBot.create(:usage, dispenser: dispenser) # Use build to create a non-persistent instance
      usage.tap_opened_at = Time.now - 2.minutes
      usage.tap_closed_at = nil
      expect(usage.calculate_total_time).to be_nil
    end
  end

  describe 'calculate_total_money_spent' do
    it 'calculates the total money spent correctly' do
      dispenser = FactoryBot.create(:dispenser, flow_volume: 1.5, price_per_liter: 2.0) # Use build to create a non-persistent instance
      usage = FactoryBot.create(:usage, dispenser: dispenser, tap_opened_at: Time.now - 2.minutes)
      usage.tap_closed_at = Time.now
      expect(usage.calculate_total_money_spent.to_f).to eq(360.0) # 2.0 per liter
    end
  end
end