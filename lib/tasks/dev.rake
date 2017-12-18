namespace :dev do
  
  task fake_restaurants: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
      )
    end
    puts "created 500 fake restaurants"
  end

  task fake_user: :environment do
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        email: "#{user_name}@example.com",
        password: "12345678"
      )
    end
    puts "create 20 fake users"
  end

  task fake_comment: :environment do
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "create 3 fake comments"
  end

end