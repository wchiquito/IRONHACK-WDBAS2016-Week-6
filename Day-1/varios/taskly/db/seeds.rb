# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create ([
  {name: 'User One', email: 'userone@test.net'},
  {name: 'User Two', email: 'usertwo@test.net'}
])

tasks = Task.create ([
  {name: 'Task 1 Task first', due_date: DateTime.now, user_id: User.first.id},
  {name: 'Task 2 Task last', due_date: DateTime.now, user_id: User.last.id}
])