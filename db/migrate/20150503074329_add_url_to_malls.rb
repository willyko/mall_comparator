class AddUrlToMalls < ActiveRecord::Migration
  def change
    add_column :malls, :url, :string
  end
end
