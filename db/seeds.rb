# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

roles_list = ["Admin"]

puts "Creating roles\n"
roles_list.each do |role|
  Role.where(name: role).first_or_create
end
module_categories_list = [["COMMUNICATION", "COMM"],
                          ["INFORMATION & COMMUNICATION TECHNOLOGY", "ICT"],
                          ["MANAGING SELF AT WORKPLACE","MSW"],
                          ["MOTIVATIONAL","MOTIV"],
                          ["HUMAN DEVELOPMENT","HUMDEV"]]

puts "Creating Categories\n"

module_categories_list.each do |category, code|
  Category.where(name: category, code: code).first_or_create
end

modules_list = [
  ["COMM","1-A", "Small Steps, Big Results in Reading Critically"],
  ["COMM","1-B", "Write Right - Winning Ways with Writing"],
  ["COMM","1-C", "Small Steps, Big Results : Heart & Soul of Communication"],
  ["ICT","2-A", "Professional Workplace Application"],
  ["ICT","2-B", "Multimedia Applications fat Workplace"],
  ["MSW","3-A", "Managing Change at Workplace"],
  ["MSW","3-B", "Winnable Relationship"],
  ["MOTIV","4-A", "Leader in You"],
  ["MOTIV","4-B", "Qiamulail Programme and Jatidiri Session"],
  ["HUMDEV","5-A", "Personal Effectiveness Toolkit"],
  ["HUMDEV","5-B", "Grooming & Etiquettes for Young Professionals"]
]

puts "Creating modules \n"
modules_list.each do |category_code, module_code, module_name|
  programme_module = ProgrammeModule.where(code: module_code, name: module_name).first_or_create
  if programme_module
    category = Category.where(code: category_code).first
    programme_module.category =  category unless category.nil?
    programme_module.save
  end
end

puts "Adding Venues"
venues_list = ["Lab", "Classroom", "Hall"]
venues_list.each do |venue|
  Venue.where(name: venue).first_or_create
end


puts "Adding modules to all ProgrammeSessions"
ProgrammeSession.all.each do |programme_session|
  if programme_session.modules.empty?
    programme_session.modules << ProgrammeModule.all
    programme_session.save
  end
end
