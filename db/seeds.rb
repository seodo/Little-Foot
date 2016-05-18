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

food = Category.create(title: "Food")
transportation = Category.create(title: "Transportation")
lifestyle = Category.create(title: "Lifestyle")

# Food
# Question 1
Question.create(content: "What did you have for breakfast? Specify the quantity for each item.", identifier: "breakfast", category_id: food.id)

# Question 2
Question.create(content: "What did you have for lunch? Specify the quantity for each item.", identifier: "lunch", category_id: food.id)

# Question 3
Question.create(content: "What did you have for dinner? Specify the quantity for each item.", identifier: "dinner", category_id: food.id)

# Transportation
# Question 5
Question.create(content: "Which mode of transportation did you use to commute today? How many miles for each did you travel.", identifier: "transport", category_id: transportation.id)

# Lifestyle
# Question 6
Question.create(content: "For how many minutes today did you use a shower?", identifier: "shower", category_id: lifestyle.id)

# Question 7
Question.create(content: "How many loads of laundry did you wash today?", identifier: "laundry_wash", category_id: lifestyle.id)

# Question 8
Question.create(content: "How many loads of laundry did you dry today?", identifier: "laundry_dry",category_id: lifestyle.id)

# Question 9
Question.create(content: "How many hours of T.V. did you watch today?", identifier: "tv", category_id: lifestyle.id)

# Question 10
Question.create(content: "Approximately how many text messages did you send today?", identifier: "text_message", category_id: lifestyle.id)

# Question 11
Question.create(content: "Approximately how many emails did you send today?", identifier: "short_email", category_id: lifestyle.id)

ImpactItem.create(name:'beef' , carbon: 5.07, unit_size: '3 Ounces', suggestion: "Try switching to a food such as chicken or tuna which would reduce your carbon footprint to 1/3rd of this meal's impact. Better yet, switching to vegetables and grains would reduce impact by 1/10th!")
ImpactItem.create(name:'lamb' , carbon: 12.17,unit_size: '5 Ounces', suggestion: "Try switching to a food such as chicken or tuna which would reduce your carbon footprint to 1/6th of this meal's impact. Better yet, switching to vegetables and grains would reduce impact by 1/24th!")
ImpactItem.create(name:'cheese' , carbon: 1.26, unit_size: '1.5 Ounces', suggestion: "Try limiting the amount of cheese you consume, use replacements flavoring - salt and spices are an easy way to make an average meal delicious!")
ImpactItem.create(name:'pork' , carbon: 2.27, unit_size: '3 Ounces', suggestion: "Try switching to grains/beans to lower your carbon footprint to 1/4th of an impact.")
ImpactItem.create(name:'turkey' , carbon: 2.73, unit_size: '4 Ounces', suggestion: "Try switching to grains/beans to lower your carbon footprint to 1/4th of an impact.")
ImpactItem.create(name:'chicken' , carbon: 1.72, unit_size: '4 Ounces', suggestion: "Try switching to grains/beans to lower your carbon footprint to 1/4th of an impact.")
ImpactItem.create(name:'tuna' , carbon: 0.77, unit_size: '2 Ounces', suggestion: "Try switching to grains/beans to lower your carbon footprint to 1/3rd of an impact.")
ImpactItem.create(name:'eggs' , carbon: 0.73, unit_size: '1 Egg', suggestion: "Try eating fewer eggs to lower your carbon footprint!")
ImpactItem.create(name:'potatoes' , carbon: 1.10, unit_size: '6 Ounces or 1 Medium Potato', suggestion: "Surprisingly potatoes have about twice the impact as grains or bread. Switch to these food options lower your impact!")
ImpactItem.create(name:'grains' , carbon: 0.51, unit_size: '3 Ounces', suggestion: '')
ImpactItem.create(name:'beans' , carbon: 0.49, unit_size: '4 Ounces', suggestion: '')
ImpactItem.create(name:'milk' , carbon: 0.95, unit_size: '8 Ounces', suggestion: 'Try switching to rice milk to lower your carbon footprint!')
ImpactItem.create(name:'car', carbon: 0.91, unit_size: '1 mile', suggestion: 'Commuting by bus will lower your carbon footprint by 50%, better still - try to walk or ride a bike for shorter trips.')
ImpactItem.create(name:'bus', carbon: 0.56, unit_size:' 1 mile', suggestion: 'Try to walk or ride a bike when possible to lower your carbon footprint!')
ImpactItem.create(name:'vegetables', carbon: 0.44, unit_size: '3.5 Ounces', suggestion: '')
ImpactItem.create(name:'fruits', carbon: 0.44, unit_size: '3.5 Ounces', suggestion: '')
ImpactItem.create(name:'commuter_rail', carbon: 0.27, unit_size: '1 mile', suggestion: 'Try to walk or ride a bike when possible to lower your carbon footprint!')
ImpactItem.create(name:'subway', carbon: 0.12, unit_size: '1 mile', suggestion: 'Try to walk or ride a bike when possible to lower your carbon footprint!')

# if this is present, we will multiply by 3.67, carbon is 0 because we are not adding to total carbon footprint in our loop to calculate carbon footprint
ImpactItem.create(name:'eat_out', carbon: 0, suggestion: '')

# in lbs:
ImpactItem.create( name: 'laundry_wash', carbon: 1.54, suggestion: 'Make sure to wash with cold water when possible.')
ImpactItem.create( name: 'laundry_dry', carbon: 3.75, suggestion: 'Air dry your laundry to eleminate your carbon footprint for this activity all together!')

# hot shower. Carbon footprint in lbs per minute:
ImpactItem.create( name: 'shower', carbon: 0.255, unit_size: '1 Minute', suggestion: 'Decrease time in the shower to reduce both carbon footprint and water consumption.')

# tv watching in kg per viewer-hour (0.088). now lbs
ImpactItem.create( name: 'tv', carbon: 0.19, unit_size: '1 Hour', suggestion: 'Try limiting your T.V. time or watching on a smaller screen. Better still, hit up your local library and get lost in a great book.')

# cup of coffee in grams. now lbs
ImpactItem.create( name: 'coffee', carbon: 0.05, unit_size: '1 Cup', suggestion: '')

# cup of tap water in grams. now lbs
ImpactItem.create( name: 'tap_water', carbon: 0.0001543235, unit_size: '1 Cup', suggestion: '')

# 500ml bottle of water in grams. now lbs
ImpactItem.create( name: 'water_bottle', carbon: 0.35, unit_size: '1 Bottle (500ml', suggestion: 'Drink tap water instead of buying water bottles if it is safe to do so in your area.')

# sending short email in grams. now lbs
ImpactItem.create( name: 'short_email', carbon: 0.01, unit_size: '1 Email without Attachment Files', suggestion: '')

# send email with attachment in grams. now lbs
ImpactItem.create( name: 'attachment_email', carbon: 0.11, unit_size: '1 Email with Attachment Files', suggestion: '')

# send a text in grams. now lbs
ImpactItem.create( name: 'text_message', carbon: 0.0000308647, unit_size: '1 Text Message', suggestion: '')

# using plastic bag in grams. now lbs
ImpactItem.create( name: 'plastic_bag', carbon: 0.02, unit_size: '1 Plastic Bag', suggestion: '')

# using paper bag in grams. now lbs
ImpactItem.create( name: 'paper_bag', carbon: 0.09, unit_size: '1 Paper Bag', suggestion: '')

# hair dryer per minute in kg: now lbs
ImpactItem.create( name: 'hair_dryer', carbon: 0.02, unit_size: '1 Minute', suggestion: '')

# toilet paper per sheet unrecycled in grams. now lbs
ImpactItem.create( name: 'toilet_paper', carbon: 0.004, unit_size: '1 Sheet', suggestion: '')

Fact.create(content: "Meat based diets have the highest carbon footprint at 3.3 tons of greenhouse gas emissions. A vegan diet has the lowest carbon footprint at just 1.5 tons CO2e. You can reduce your foodprint by a quarter just by cutting down on red meats such as beef and lamb", category_id: 1)
Fact.create(content:"The carbon footprint of a vegetarian diet is about half that of a meat-lover’s diet.", category_id: 1)
Fact.create(content: "Approximately 13% of U.S. greenhouse gas emissions result from the production and transport of food.", category_id: 1)
Fact.create(content: "Organic farming methods for both crops and animals have a much lower impact on the environment than conventional methods.", category_id: 1)
Fact.create(content: "Check the label – a long list of ingredients generally means a heavily processed item with a high carbon footprint", category_id: 1)
Fact.create(content: "Frozen food has the highest carbon footprint, followed by canned, plastic, glass, then cardboard", category_id: 1)
Fact.create(content: "A typical restaurant meal’s CO2e emissions is 3.67 times the CO2e emissions of a meal prepared and eaten at home", category_id: 1)
Fact.create(content: "The carbon footprint of a six-pack of beer from New Belgium Brewing Co. is about seven pounds", category_id: 1)
Fact.create(content: "You could save more than a ton of CO2 per year by accelerating slowly and smoothly, driving the speed limit, maintaining a steady speed, and anticipating your stops and starts.", category_id: 2)
Fact.create(content: "Keeping your tires properly inflated can can save 400-700 pounds of CO2 per year.", category_id: 2)
Fact.create(content: "For every mile it travels, the average car in the U.S. emits about one pound of carbon dioxide, which translates into about five tons of carbon dioxide per car per year", category_id: 2)
Fact.create(content: "Park your car once a day if possible and work from home or just walk to your destination. Carpooling is a great way to help reduce carbon emissions.", category_id: 2)
Fact.create(content: "Washing and drying a load every two days creates around 440kg of CO2e each year, which is equivalent to flying from London to Glasgow and back with 15-mile taxi rides to and from the airports.", category_id: 3)
Fact.create(content: "A household running a dryer 200 times a year could save nearly half a tonne of CO2e by switching to a clothes rack or washing line.", category_id: 3)
Fact.create(content: "The U.S. emits the equivalent of about 118 pounds of carbon dioxide per resident every day.", category_id: 3)
Fact.create(content: "Take a shower rather than a bath and shower less often in less time", category_id: 3)
Fact.create(content: "Turn off lights you’re not using and when you leave the room. Replace incandescent light bulbs with compact flourescent or LED ones.", category_id: 3)





