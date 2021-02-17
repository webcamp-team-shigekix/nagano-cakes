class ChangePcodeToString < ActiveRecord::Migration[5.2]
  def up
    change_table :receivers do |t|
      t.change :postal_code, :string
    end
  end

  def down
    change_table :receivers do |t|
      t.change :postal_code, :integer
    end
  end
end
