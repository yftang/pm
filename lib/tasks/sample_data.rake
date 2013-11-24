namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
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
    
    users = User.all(limit: 6)
    50.times do |n|
      acc = "Project_#{n}"
      description = Faker::Lorem.sentence(5)
      start_date  = Time.now.to_date
      dead_line   = n.days.from_now.to_date
      users.each { |user| 
        user.projects.create!(
          acc: "#{acc}_#{user.id}",
          description: description,
          start_date:  start_date,
          dead_line:   dead_line
        )
      }
    end
  end
end
