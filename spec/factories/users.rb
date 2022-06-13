FactoryBot.define do
  factory :user do
    name { "admin" }
    email { "admin@admin.com" }
    password { "111111" }
    admin { "true" }
  end
  factory :second_user, class: User do
    name { "user" }
    email { "user@user.com" }
    password { "111111" }
    admin { "false" }
  end
end
