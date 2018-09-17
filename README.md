# Jungle

Jungle is a mini e-commerce application built with Rails 4.2.

This is a project I built as part of the web development bootcamp at Lighthouse Labs. The purpose was to gain practice using Ruby on Rails for the first time. I had to inherit and become familiar with an existing codebase, and use git branches to add features.

Some of the functionality the page has:
- A confirmation email with full order details is sent upon cart checkout (go to '/rails/mailers' for previews)
- Users can review and rate products, and delete any reviews that they have written
- Users cannot review the same product twice (unless they delete their first review)
- Average ratings are displayed in catalog and product pages, and update upon creation or deletion of a review
- Visitors can still see reviews in reverse chronological order, but cannot write a review
- Flash messages used across entire site to display notifications and errors
- Admin pages use basic authentication to restrict access (name: 'Jungle', password: 'book')
- Fully functioning account registration and login
- Passwords are encrypted using the bcrypt gem

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Testing

You can create a new user or use email: 'test@test.com', password: 'bob' to login.

Use Credit Card # 4111 1111 1111 1111 for testing cart checkout.

More information in Stripe docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots

Home Page - Product Catalog
!["Screenshot of product catalog"](https://github.com/jordanyoungs/jungle-rails/blob/master/docs/product-catalog.png?raw=true)

Admin Authentication
!["Screenshot of admin authentication"](https://github.com/jordanyoungs/jungle-rails/blob/master/docs/admin-login.png?raw=true)

Cart Checkout
!["Screenshot of cart checkout"](https://github.com/jordanyoungs/jungle-rails/blob/master/docs/cart-checkout.png?raw=true)

Post-Checkout
!["Screenshot of post-checkout"](https://github.com/jordanyoungs/jungle-rails/blob/master/docs/successful-checkout.png?raw=true)

Confirmation Email Preview
!["Screenshot of email preview"](https://github.com/jordanyoungs/jungle-rails/blob/master/docs/email-preview.png?raw=true)

Recently Submitted Review
!["Screenshot of submitted review"](https://github.com/jordanyoungs/jungle-rails/blob/master/docs/submitted-review.png?raw=true)

Visitor Reviews
!["Screenshot of visitor reviews"](https://github.com/jordanyoungs/jungle-rails/blob/master/docs/visitor-reviews.png?raw=true)
