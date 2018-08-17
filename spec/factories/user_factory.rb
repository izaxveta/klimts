FactoryBot.define do
  factory :user do
    email { 'tara.thorton@fangtasia.com' }
    password { 'password' }
    first_name { 'Tara' }
    last_name { 'Thorton' }
    address { '1624 Silverlee Rd Bon Temps, Louisiana 70471' }
    role { 0 }
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email { 'pam.debeaufort@fangtasia.com' }
    password { 'password' }
    first_name { 'Pamela' }
    last_name { 'De Beaufort' }
    address { '1624 Silverlee Rd Bon Temps, Louisiana 70471' }
    role { 1 }
  end
end