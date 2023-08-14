# config/initializers/stripe.rb
Rails.configuration.stripe = {
    publishable_key: ENV['pk_test_51NehkxSB1y27lqYj2hV9vRWQGG7NghkpBQJTKWJFQmgba0pXAEqO7oUfJUhh3ZXiXDxlCTymJndH5hgaM3KV8cva00Nb6JgeCN'],
    secret_key: ENV['sk_test_51NehkxSB1y27lqYjyxS0MmdYQmK3fsMuEzcqGirMpUCEMXziITXFzt6j6xucBCrltNHAxMdRM6JvBk2c96Q0kGYH00C5VJc1PC']
  }
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
  