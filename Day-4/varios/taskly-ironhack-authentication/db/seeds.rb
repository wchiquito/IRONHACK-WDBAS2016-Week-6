# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
  {name: 'Ian',  email: 'ian@dischord.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Henry',  email: 'hank@sst.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Glenn', email: 'danzig@plan9.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'H.R.', email: 'paul@reachoutinternational.com', password: '12345678', password_confirmation: '12345678'}
])

tasks = Task.create([
  {name: 'Task 1 for Ian',  	due_date: DateTime.now, user_id: users[0].id},
  {name: 'Task 2 for Ian',  	due_date: DateTime.now, user_id: users[0].id},
  {name: 'Task 1 for Henry',  due_date: DateTime.now, user_id: users[1].id},
  {name: 'Task 2 for Henry',  due_date: DateTime.now, user_id: users[1].id},
  {name: 'Task 1 for Glenn',  due_date: DateTime.now, user_id: users[2].id},
  {name: 'Task 2 for Glenn',  due_date: DateTime.now, user_id: users[2].id},
  {name: 'Task 1 for H.R.',   due_date: DateTime.now, user_id: users[3].id},
  {name: 'Task 2 for H.R',  	due_date: DateTime.now, user_id: users[3].id},
])