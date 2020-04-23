class CreateNgoCommitments < ActiveRecord::Migration[5.2]
  def change
    create_table :ngo_commitments do |t|
			t.belongs_to :ngo, index: true
			t.belongs_to :commitment, index: true
      t.timestamps
    end
  end
end
