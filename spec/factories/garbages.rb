# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :garbage do
    total 1.5
    open_air 1.5
    wetlands 1.5
    landfill 1.5
    sanitary_landfill 1.5
    composting 1.5
    screening 1.5
    incineration 1.5
    not_fixed 1.5
    others 1.5
    year "MyString"
    local nil
  end
end
