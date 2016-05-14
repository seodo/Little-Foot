# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Response.destroy_all
Survey.destroy_all
Category.destroy_all
Question.destroy_all

User.create(full_name: "Patrick Swayze", email: "hello@email.com", password: "12345678")
User.create(full_name: "Julia Roberts", email: "hey@email.com", password: "12345678")
User.create(full_name: "Johnny Depp", email: "hi@email.com", password: "12345678")

Survey.create(user_id: 1)
Survey.create

Category.create(title: "Food")
Category.create(title: "Transportation")

# Question 1
Question.create(content: "What did you have for breakfast? Check all that apply and the serving amount.", category_id: 1, food_choices: true)

# Question 2
Question.create(content: "What did you have for lunch? Check all that apply and the serving amount.", category_id: 1, food_choices: true)

# Question 3
Question.create(content: "What did you have for dinner? Check all that apply and the serving amount.", category_id: 1, food_choices: true)

# Question 4
Question.create(content: "How many times have you eaten out at a restaurant today?", category_id: 1)

# Question 5
Question.create(content: "What was your mode of transportation today? How many miles for each did you travel.", category_id: 2, transportation_choices: true)


ImpactItem.create(name:'beef' , carbon: 5.07)
ImpactItem.create(name:'lamb' , carbon: 12.17)
ImpactItem.create(name:'cheese' , carbon: 1.26)
ImpactItem.create(name:'pork' , carbon: 2.27)
ImpactItem.create(name:'turkey' , carbon: 2.73)
ImpactItem.create(name:'chicken' , carbon: 1.72)
ImpactItem.create(name:'tuna' , carbon: 0.77)
ImpactItem.create(name:'eggs' , carbon: 0.73)
ImpactItem.create(name:'potatoes' , carbon: 1.10)
ImpactItem.create(name:'grains' , carbon: 0.51)
ImpactItem.create(name:'beans' , carbon: 0.49)
ImpactItem.create(name:'milk' , carbon: 0.95)
ImpactItem.create(name:'car', carbon: 0.91)
ImpactItem.create(name:'bus', carbon: 0.56)
ImpactItem.create(name:'commuter_rail', carbon: 0.27)
ImpactItem.create(name:'subway', carbon: 0.12)

# in lbs:
ImpactItem.create( name: 'laundry_wash', carbon: 1.54 )
ImpactItem.create( name: 'laundry_dry', carbon: 3.75 )

# hot shower. Carbon footprint in lbs per minute:
ImpactItem.create( name: 'shower', carbon: 0.255 )

# tv watching in kg per viewer-hour (0.088). now lbs
ImpactItem.create( name: 'tv', carbon: 0.19 )

# cup of coffee in grams. now lbs
ImpactItem.create( name: 'coffee', carbon: 0.05 )

# pint of tap water in grams. now lbs
ImpactItem.create( name: 'tap_water', carbon: 0.000308647 )

# 500ml bottle of water in grams. now lbs
ImpactItem.create( name: 'water_bottle', carbon: 0.35 )

# sending short email in grams. now lbs
ImpactItem.create( name: 'short_email', carbon: 0.01 )

# send email with attachment in grams. now lbs
ImpactItem.create( name: 'attachment_email', carbon: 0.11 )

# send a text in grams. now lbs
ImpactItem.create( name: 'text', carbon: 0.0000308647 )

# using plastic bag in grams. now lbs
ImpactItem.create( name: 'plastic_bag', carbon: 0.02 )

# using paper bag in grams. now lbs
ImpactItem.create( name: 'paper_bag', carbon: 0.09 )

# hair dryer per minute in kg: now lbs
ImpactItem.create( name: 'hair_dryer', carbon: 0.02 )

# toilet paper per sheet unrecycled in grams. now lbs
ImpactItem.create( name: 'toilet_paper', carbon: 0.004 )






