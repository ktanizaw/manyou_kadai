FactoryBot.define do
  factory :task do
    id { 100 }
    title { 'タイトル１' }
    content { 'コンテント１' }
    rank { 3 }
    deadline {"2020-11-11 17:48:00"}
    status { 1 }
    user_id { 100 }
  end
  factory :second_task, class: Task do
    id { 200 }
    title { 'タイトル２' }
    content { 'コンテント２' }
    rank { 2 }
    deadline {"2030-11-11 17:48:00"}
    status { 1 }
    user_id { 200 }
  end
end
