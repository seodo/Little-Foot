json.surveys @surveys do |survey|
  json.id survey.id
  json.created_at format_date(survey.created_at)
  json.food_category survey.calculate_footprint_by_category('food')
  json.transportation_category survey.calculate_footprint_by_category('transportation')
  json.lifestyle_category survey.calculate_footprint_by_category('lifestyle')
end
