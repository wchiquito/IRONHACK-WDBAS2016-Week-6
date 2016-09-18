# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { name: 'John Doe', email: 'john@doe.com', active: true },
  { name: 'John Smith', email: 'john@smith.com' },
  { name: 'Jane Doe', email: 'jane@doe.com' }
])

tasks = Task.create([
  { name: 'User 1 Task 1', status: 'pending', user_id: users[0].id },
  { name: 'User 1 Task 2', status: 'pending', user_id: users[0].id },
  { name: 'User 2 Task 1', status: 'pending', user_id: users[1].id },
  { name: 'User 2 Task 2', status: 'done'   , user_id: users[1].id },
  { name: 'User 3 Task 1', status: 'pending', user_id: users[2].id },
  { name: 'User 3 Task 2', status: 'done'   , user_id: users[2].id },
  { name: 'User 3 Task 3', status: 'in the works', user_id: users[2].id }
])