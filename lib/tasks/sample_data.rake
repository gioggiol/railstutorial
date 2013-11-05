namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    admin = User.create!(name: "Example admin",
                         email: "exampleadmin@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)

    User.create!(name: "Example user",
                 email: "exampleuser@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end

#Here create! is just like the create method, except it raises an exception (Section 6.1.4) 
#for an invalid user rather than returning false. This noisier construction makes debugging 
#easier by avoiding silent errors.

