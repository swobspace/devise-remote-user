require 'spec_helper'
require 'devise'
require 'devise_remote_user/manager'

class User

  attr_accessor :id, :email, :username

  def self.where(condition)
    users.key?(condition.values.first) ? [users[condition.values.first]] : []
  end

  def self.create(attrs)
    user = User.new
    user.id = SecureRandom.uuid
    users[user.id] = user
    update(user, attrs)
  end

  def self.update_attributes(user, attrs)
    users[user.id].merge(attrs)
  end

  def self.delete(user)
    users.delete(user.id)
  end

  def self.users
    @@users ||= {}
  end

  def update_attributes(attrs)
    User.update_attributes(self, attrs)
  end

  def delete
    User.delete(self)
  end

end

describe DeviseRemoteUser::Manager do
  
end
