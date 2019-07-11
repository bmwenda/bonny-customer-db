class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :customer_id, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :surname, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.string :region, null: false
      t.string :job_classification, null: false
      t.date :date_joined, null: false
      t.float :balance, null: false
      t.string :status

      t.timestamps
    end
  end
end
