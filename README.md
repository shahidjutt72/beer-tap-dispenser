# Self Service Beer Tap Dispensers

## Prerequisites

1. Ruby installed (version 3.2.0)
2. Postgresql installed and running (version 11 or up)

## Installing required dependencies

1. Install backend dependencies `bundle install`
2. Set postgresql default password `sudo -u postgres psql -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD 'password';"`

## Setting up the app

1. cp .env.test .env
2. put all values in .env for DB
3. run `rails db:create` `rails db:migrate` `rails db:seed`

## Start the Rails server

1. `rails server` to run rails server
2. The application should now be accessible at `http://localhost:3000`
3. Navigate to  `http://localhost:3000/admin` for admin panel
4. From admin panel dispensers can be crated with flow volume and price per liter