# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@user = User.create email: "jd@isotope11.com", password: "password", password_confirmation: "password", :username => "johndavid400"

@post1 = Post.create title: "Robotic Chicken", body: "The first robotic chicken was created last week in Geneva, by a group of two scientists that were cloned from stem-cells and the rump of a large cappola pig. Some critics are skeptical of the results, saying that they are 'biased' toward pigs and not fair enough to cows, but others agree with Mr. Anderson.", user_id: @user.id, image: File.open(File.join(Rails.root, "db", "seeds", "images", "image1.jpg")), featured: true

@post2 = Post.create title: "Prototype Airplane", body: "A robotic airplane is being built that will traverse up to 200,000 miles of air in one charge and with no human pilot. The airplane is made of hydrogen which is actually impossible, but that didn't stop two brothers from the University of Jamaica from doing just that..", user_id: @user.id, image: File.open(File.join(Rails.root, "db", "seeds", "images", "image2.jpg")), featured: true

@post3 = Post.create title: "The Robo-boogie", body: "If a robot boogies in the forest and there is no one there to see it, does it really happen? Researchers in Mississippi don't think so. For the love of Jermaine, why would you dress your friend up like a robot? The answer lies within, the robot suit - it's on a piece of paper.", user_id: @user.id, image: File.open(File.join(Rails.root, "db", "seeds", "images", "image3.jpg")), featured: true
