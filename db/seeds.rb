# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = Project.create([{title: 'Home Chores'}, {title: 'Job Applications'}, {title: 'Homework'}])

projects.each do |project|
  project.tasks.create([{name: 'Sample Task 1'}, {name:'Sample Task 2'}, {name: 'Sample Task 3'}])
end
