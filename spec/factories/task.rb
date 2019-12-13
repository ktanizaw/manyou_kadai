FactoryBot.define do
  factory :task do
    title { 'タイトル１' }
    content { 'コンテント１' }
    rank { 3 }
    deadline {"2020-11-11 17:48:00"}
    status { 1 }
  end
  factory :second_task, class: Task do
    title { 'タイトル２' }
    content { 'コンテント２' }
    rank { 2 }
    deadline {"2030-11-11 17:48:00"}
    status { 1 }
  end
end
