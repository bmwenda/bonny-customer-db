FactoryBot.define do
  factory :customer do
    name { "MyString" }
    surname { "MyString" }
    gender { "MyString" }
    age { 1 }
    region { "MyString" }
    job_classification { "MyString" }
    date_joined { "2019-07-11" }
    balance { 1.5 }
    status { "MyString" }
  end
end
