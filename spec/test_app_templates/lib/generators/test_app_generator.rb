require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base

  source_root "spec/test_app_templates"

  def initialize_devise
    gem "devise"
    gem "rspec-rails", group: :test
    generate "devise:install"
    inject_into_file "config/initializers/devise.rb", 
    after: "# Many of these configuration options can be set straight in your model.\n" do
      "require 'devise'\n"
    end
    generate "devise", "user"
    rake "db:migrate"
    # route "devise_for :users"
    gsub_file 'app/models/user.rb', /^devise/, "devise :remote_user_authenticatable"
  end

end

