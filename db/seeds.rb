# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Role
role = Role.create(name:'Admin')
Role.create(name:'Management')
Role.create(name:'User')

#User
user = User.create(username:'Administrator', email:'admin@daily.spending.com', password:'kt15693')

#User Roles
UserRole.create(user_id:user.id, role_id:role.id)