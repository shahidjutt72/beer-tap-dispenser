ActiveAdmin.register Dispenser do
  permit_params :flow_volume, :price_per_liter, :tap_open_count

  index do
    selectable_column
    id_column
    column :flow_volume
    column :price_per_liter
    column :tap_open_count
    column :created_at
    actions
  end

  filter :flow_volume
  filter :price_per_liter
  filter :tap_open_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :flow_volume
      f.input :price_per_liter
    end
    f.actions
  end
end
