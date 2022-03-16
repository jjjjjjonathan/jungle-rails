# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

This project was made to mimic a realistic situation where I would join a new team for an app to make bug fixes in a language/framework I'm unfamiliar with. The features and bug fixes I made to this app are:

- Formatting money properly
- Changing the UI for empty carts, sold out items, and order details
- Adding security for admin sections, and an admin categories section
- Creating an about page
- Creating user authentication with login and register pages
- Writing tests for the home page, product details, adding to cart methods, product models, and user models
- Using ActionMailer to send order receipts after a sale is completed

## Stack

- Ruby on Rails 4.2
- ActiveRecord
- ActionMailer
- ERB
- RSpec
- Capybara
- Poltergeist

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
