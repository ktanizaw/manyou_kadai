FactoryBot.define do
  factory :labelling do
    label_id { 100 }
    task_id { 100 }
  end
  factory :second_labelling, class: Labelling do
    label_id { 200 }
    task_id { 200 }
  end
end
