class PasswordsController < ApplicationController
  before_filter :verify

  def change_password
    @foo = "foo"
    binding.pry
  end

  private

  def verify
    @foo = "bar"
    binding.pry
  end

end
