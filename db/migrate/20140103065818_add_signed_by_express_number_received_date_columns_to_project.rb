class AddSignedByExpressNumberReceivedDateColumnsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :delivery_signed_by, :string
    add_column :projects, :delivery_express_number, :string
    add_column :projects, :delivery_received_date, :date
  end
end
