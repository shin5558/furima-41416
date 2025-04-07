class RenameDeliveryDaysIdToDeliveryDayIdInItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :delivery_days_id, :delivery_day_id
  end
end