FactoryBot.define do
  factory :user do
    name { 'test1' }
    email { 'test1@test.com' }
    password { 'test111' }
    password_confirmation { 'test111' }
    admin { true }
  end
  factory :second_user, class: User do
    name { 'test2' }
    email { 'test2@test.com' }
    password { 'test222' }
    password_confirmation { 'test222' }
    admin { false }
  end
end
