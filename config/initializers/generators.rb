Rails.application.config.generators do |g|
  g.test_framework :rspec, :views => false, :fixture => true
  g.fixture_replacement :factory_girl, :dir => 'spec/factories'
  g.template_engine :haml  
  g.view_specs false
  g.helper_specs false  
end
