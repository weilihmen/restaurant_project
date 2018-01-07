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

  task fake_20users: :environment do
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        name: FFaker::Name.first_name,
        intro: FFaker::Lorem.paragraph,
        email: "#{user_name}@com",
        password: "12345678"
      )
    end
    puts "create 20 fake users"
  end

  task fake_50comments: :environment do
    50.times do |i|
        Comment.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample,
          restaurant: Restaurant.all.sample
        )
    end
    puts "create random 50 fake comments"
  end

  task fake_50favorites: :environment do
    50.times do |i|
        Favorite.create!(
          user: User.all.sample,
          restaurant: Restaurant.all.sample
        )
    end
    puts "create random 50 fake favorites"
  end

  task fake_50likes: :environment do
    50.times do |i|
        Like.create!(
          user: User.all.sample,
          restaurant: Restaurant.all.sample
        )
    end
    puts "create random 50 fake likes"
  end

  task fake_20follow: :environment do
    20.times do |i|
      Followship.create!(
        user: User.all.sample,
        following: User.all.sample
        )
    end
    puts "create random 20 fake follow"
  end

end