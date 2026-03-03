
class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowers do |t|
      t.string :borrower
      t.string :bookname
      t.timestamps
    end
  end
end