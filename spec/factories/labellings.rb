FactoryBot.define do
  factory :labelling do
    label_id { 1 }
    task_id { 1 }
  end
  factory :second_labelling, class: Labelling do
    label_id { 2 }
    task_id { 2 }
  end
end
