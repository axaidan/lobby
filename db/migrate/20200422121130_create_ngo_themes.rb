class CreateNgoThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :ngo_themes do |t|
			t.belongs_to :ngo, index: true
			t.belongs_to :theme, index: true
      t.timestamps
    end
  end
end
