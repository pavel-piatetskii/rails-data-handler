# README

## General information
This is a sample Ruby on Rails project. It fetches a set of JSON-formatted objects from a remote API, stores, filters and outputs them to the /update/index page (the root route redirects to this page as well).

## Database usage
Project requires PostgreSQL to store the data retreived from the API.

## How to start
1. **bundle install** - install dependencies
2. **rake db:create** - create databese to store data from the API
3. **rails s** - launch the application server\
   if it is launched from within the virtual machine,\
   **rails s -b 0.0.0.0** should be used instead to make the app available from the host machine
4. open **localhost:3000** in a browser
