# Jungle

A mini e-commerce application built with Rails 4.2.


## Setup

-   Fork & Clone
-   Run `bundle install` to install dependencies
-   Create `config/database.yml` by copying `config/database.example.yml`
-   Create `config/secrets.yml` by copying `config/secrets.example.yml`
-   Run `bin/rake db:reset` to create, load and seed db
-   Create .env file based on .env.example
-   Sign up for a Stripe account
-   Put Stripe (test) keys into appropriate .env vars
-   Run `bin/rails s -b 0.0.0.0` to start the server
-   Register for two user accounts on the app to see reviews

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 ex: 08/19 cv: 1234 for testing success scenarios.

More information in Stripes docs: <https://stripe.com/docs/testing#cards>

## Dependencies

-   Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
-   PostgreSQL 9.x
-   Stripe
