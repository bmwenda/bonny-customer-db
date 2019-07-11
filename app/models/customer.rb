class Customer < ApplicationRecord
  validates :name, :surname, :gender, :age, :region, :job_classification, \
            :date_joined, :balance, presence: true
end
