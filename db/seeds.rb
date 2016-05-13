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
Question.create(content: "What did you have for breakfast? Check all that apply and the serving amount.", category_id: 1)

# Question 2
Question.create(content: "What did you have for lunch? Check all that apply and the serving amount.", category_id: 1)

# Question 3
Question.create(content: "What did you have for dinner? Check all that apply and the serving amount.", category_id: 1)

# Question 4
Question.create(content: "How many times have you eaten out at a restaurant today?", category_id: 1)


 Response.create(content: 'eggs', question_id: 1, survey_id: 1)
 Response.create(content: '1 serving', question_id: 2, survey_id: 1)


