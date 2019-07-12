class Customer < ApplicationRecord
  validates :name, :surname, :gender, :age, :region, :job_classification, \
            :date_joined, :balance, presence: true
  validates :customer_id, presence: true, uniqueness: true

  after_create :add_customer_to_mailing_list

  private

  def add_customer_to_mailing_list
    SubscribeCustomerJob.perform_later(self)
  end
end
