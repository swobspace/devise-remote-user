require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base

  source_root "spec/test_app_templates"

  gem "devise"
  
  # Devise
  generate "devise:install"
  generate "devise", "user"
  rake "db:migrate"
  # route "devise_for :users"
  gsub_file 'app/models/user.rb', /^devise/, "devise :remote_user_authenticatable"

end

