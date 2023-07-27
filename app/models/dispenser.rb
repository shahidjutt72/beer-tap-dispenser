class Dispenser < ApplicationRecord
  has_many :usages, dependent: :destroy

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at flow_volume id price_per_liter tap_open_count updated_at]
  end

  def as_json(options = {})
    super(options.merge(include: :usages))
  end

  def last_usage
    @last_usage ||= usages.last
  end

  def tap_open?
    last_usage && last_usage.tap_closed_at.nil?
  end

  def tap_closed?
    last_usage && last_usage.tap_closed_at.present?
  end
end
