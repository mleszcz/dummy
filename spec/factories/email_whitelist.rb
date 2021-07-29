FactoryBot.define do
  factory :email_whitelist, class: EmailWhitelist do
    email { 'joe@joe.com' }
  end
end
