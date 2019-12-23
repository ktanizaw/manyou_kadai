FactoryBot.define do
  factory :label do
    id { 100 }
    name { 'test1' }
    user_id { 100 }
  end
  factory :second_label, class: Label do
    id { 200 }
    name { 'test2' }
    user_id { 200 }
  end
end
