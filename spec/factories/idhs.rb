# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idh do
    idhm "MyString"
    income 1.5
    longevity 1.5
    education 1.5
    year "MyString"
    locale nil
  end
end
