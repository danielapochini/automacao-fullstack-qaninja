require_relative "models/user_model"

FactoryBot.define do
    factory :user, class: UserModel do
        full_name {"Daniela Pochini"}
        email {"qaninja@papito.io"}
        password {"teste1234"}

        after(:build) do |user|
            #puts "apagando o email " + user.email
            Database.new.delete_user(user.email)
        end
    end

    factory :registered_user, class: UserModel do
        full_name {"Daniela Pereira"}
        email {"eu@papito.io"}
        password {"teste1234"}

        after(:build) do |user|
            #puts "apagando o email " + user.email
            Database.new.delete_user(user.email)
            ApiUser.save(user.to_hash)
        end
    end

    factory :user_wrong_email, class: UserModel do
        full_name {"Daniela Pochini"}
        email {"qaninja#papito.io"}
        password {"teste1234"}
    end

    factory :empty_name_user, class: UserModel do
        full_name {""}
        email {"qaninja@papito.io"}
        password {"teste1234"}   
    end

    factory :empty_email_user, class: UserModel do
        full_name {"Daniela Pochini"}
        email {""}
        password {"teste1234"}   
    end

    factory :empty_password_user, class: UserModel do
        full_name {"Daniela Pochini"}
        email {"qaninja@papito.io"}
        password {""}   
    end
end