# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
N_USER = 80

users = []

(1..N_USER).each do |i|
	if i % 2 == 0
	  u = User.new(name: "test#{i}", email: "example#{i}@example.com", role: "guest")
	  u.password = 'hogehoge'
	  u.save!(validate: false)
	  u.guest.create
	  users << u
	 elsif i % 2 == 1
	  u = User.new(name: "test#{i}", email: "example#{i}@example.com", role: 'owner')
	  u.password = 'hogehoge'
	  u.save!(validate: false)
	  u.owner.create
	  users << u
end
plan_params = [
	  plan_date_attributes: {start_dates:"2016-12-15", finish_dates:"2016-12-30"},
      plan_place_attributes: {place: "岩手県"},
      plan_num_of_customer_attributes: {number: 5},
      plan_budget_attributes: {budget: 20000},
      plan_detail_attributes: {detail:"杖り"}
	],[
	  plan_date_attributes: {start_dates:"2016-12-1", finish_dates:"2016-12-2"},
      plan_place_attributes: {place: "宮城県"},
      plan_num_of_customer_attributes: {number: 12},
      plan_budget_attributes: {budget: 100000},
      plan_detail_attributes: {detail:"色々"}
	],[
	  plan_date_attributes: {start_dates:"2016-12-7", finish_dates:"2016-12-14"},
      plan_place_attributes: {place: "東京"},
      plan_num_of_customer_attributes: {number: 1},
      plan_budget_attributes: {budget: 10000},
      plan_detail_attributes: {detail:"一人旅"}
	],[
	  plan_date_attributes: {start_dates:"2016-12-30", finish_dates:"2016-12-31"},
      plan_place_attributes: {place: "沖縄"},
      plan_num_of_customer_attributes: {number: 5},
      plan_budget_attributes: {budget: 90000},
      plan_detail_attributes: {detail:"海"}
	]

	(1..4).each do |i|
		(1..4).each do |j|
			user = User.find(i)
			if user.role = 'guest'
				user.plan.create(plan_params[j + 1])
			end
		end
	end
end
			

