class AddAdditionalInformationsToNgo < ActiveRecord::Migration[5.2]
  def change
		add_column :ngos, :name, :string
		add_column :ngos, :url, :string
		add_column :ngos, :description, :text
		add_column :ngos, :status, :boolean
  end
end
