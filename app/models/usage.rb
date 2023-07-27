class Usage < ApplicationRecord
  belongs_to :dispenser

  before_save :calculate_total_time, :calculate_total_money_spent

  def open_tap
    update(tap_opened_at: Time.now, tap_closed_at: nil)
    dispenser.increment!(:tap_open_count)
  end

  def close_tap
    update(tap_closed_at: Time.now)
  end

  def calculate_total_time
    # If the tap is closed, calculate the total_time based on tap_opened_at and tap_closed_at
    return unless tap_opened_at.present? && tap_closed_at.present?

    self.total_time = (tap_closed_at - tap_opened_at).to_i
  end

  def calculate_total_money_spent
    # Retrieve the flow_volume and price_per_liter of the dispenser
    flow_volume = dispenser.flow_volume
    price_per_liter = dispenser.price_per_liter

    # Calculate the total volume of beer dispensed in liters
    total_volume = flow_volume * total_time

    # Calculate the total money spent based on the price per liter
    self.total_money_spent = total_volume * price_per_liter
  end

end
