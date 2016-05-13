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

Survey.create(user_id: 8)
Survey.create

Category.create(title: "Food")
Category.create(title: "Transportation")

Question.create(content: "What did you have for breakfast?", survey_id: 1, category_id: 1)
Question.create(content: "What did you have for lunch?", survey_id: 1, category_id: 1)
Question.create(content: "What mode of transportation did you take?", category_id: 2,survey_id: 2)
Question.create(content: "How many miles?", category_id: 2, survey_id: 2)
 Response.create(content: 'Yes', question_id: 1)
 Response.create(content: 'No', question_id: 2)


