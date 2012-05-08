stripe_config = YAML.load(File.open(File.join(Rails.root, 'config', 'stripe.yml')))

Stripe.api_key =    ENV['STRIPE_API_KEY']           || stripe_config[:api_key]
STRIPE_PUBLIC_KEY = ENV['STRIPE_PUBLIC_KEY'] || stripe_config[:public_key] 
