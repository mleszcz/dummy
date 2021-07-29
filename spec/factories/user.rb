FactoryBot.define do
  factory :user, class: User do
    email { 'joe@joe.com' }
    name { 'name' }
    password { 'password' }
  end
end
