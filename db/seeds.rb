# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create({name:"Raul",email:"correo@mail.com",""})
['superadmin', 'admin', 'area-manager', 'supervisor','staff', 'dispatcher', 'user'].each do |role|
  Role.find_or_create_by({name: role})
end

[
  {
    "email": "raul@mail.com",
    "password": "12345678",
    "password_confirmation": "12345678",
    "name":"raul",
    "first_name":"Raul",
    "last_name":"Sanz",
    "role_id":1
  },
  {
    "email": "jose@mail.com",
    "password": "12345678",
    "password_confirmation": "12345678",
    "name":"jose",
    "first_name":"Jose",
    "last_name":"Sanz",
    "role_id":2
  },
  {
    "email": "juan@mail.com",
    "password": "12345678",
    "password_confirmation": "12345678",
    "name":"juan",
    "first_name":"Juan",
    "last_name":"Sanz",
    "role_id":3
  },
  {
    "email": "marco@mail.com",
    "password": "12345678",
    "password_confirmation": "12345678",
    "name":"marco",
    "first_name":"Marco",
    "last_name":"Sanz",
    "role_id":4
  },
  {
    "email": "lore@mail.com",
    "password": "12345678",
    "password_confirmation": "12345678",
    "name":"lore",
    "first_name":"Lore",
    "last_name":"Sanz",
    "role_id":5
  },
  {
    "email": "ken@mail.com",
    "password": "12345678",
    "password_confirmation": "12345678",
    "name":"ken",
    "first_name":"Ken",
    "last_name":"Sanz",
    "role_id":6
  },
  {
    "email": "james@mail.com",
    "password": "12345678",
    "password_confirmation": "12345678",
    "name":"james",
    "first_name":"James",
    "last_name":"Sanz",
    "role_id":7
  }
].each do |user| 
  User.create(user)
end