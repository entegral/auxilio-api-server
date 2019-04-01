# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

default_users = [
  {
    first_name: 'robb',
    last_name: 'stark',
    email: 'robb@gmail.com',
    uid: 'DivdjuUMAgOZKQazbZE2JbARuom2'
  },
  {
    first_name: 'arya',
    last_name: 'stark',
    email: 'arya@gmail.com',
    uid: 'xl9q4F6UgiZkTcnrOa8DZhBIyl32'
  },
  {
    first_name: 'terminator',
    last_name: 'one',
    email: 't9@gmail.com',
    uid: 'igghuohaIqaYzUsLE3jNroK93Dr2'
  }  
]

default_orgs = [
  {
    uid: '33847794-c86e-406c-9fa7-a9f64f161475',
    name: 'Blue Oasis',
    password: 'password'
  },
  {
    uid: 'a9f64f161475-c86e-406c-9fa7-33847794',
    name: 'Arctica',
    password: 'password'
  },
  {
    uid: 'c86e-406c-a9f64f161475-9fa7-33847794',
    name: 'Camp Questionmark',
  },
  {
    uid: '9fa7-33847794c86e-406c-a9f64f161475-',
    name: 'Tectonic',
  }
]

Organization.create(default_orgs)
User.create(default_users)