json.surveys @surveys do |survey|
  json.id survey.id
  json.latitude survey.latitude
  json.longitude survey.longitude
  json.carbon_footprint survey.calculate_footprint
end

