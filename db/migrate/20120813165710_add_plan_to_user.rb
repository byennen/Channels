class AddPlanToUser < ActiveRecord::Migration
  def change
    add_column :users, :stripe_plan, :string
  end
end
