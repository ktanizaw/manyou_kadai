FactoryBot.define do
  factory :label do
    id { 1 }
    name { 'test' }
    user_id { 1 }
  end
  factory :second_label, class: Label do
    id { 2 }
    name { 'test2' }
    user_id { 2 }
  end
end
