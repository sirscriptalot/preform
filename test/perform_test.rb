require 'digest'

require_relative '../lib/preform'

class EmailField < Preform::Field
  def validate
    assert value.include?('@'), key, 'invalid format'
  end
end

class PasswordField < Preform::Field
  def validate
    assert value.length > 6, key, 'too short'
  end

  def digest
    Digest::MD5.digest(value) # pretend this is secure
  end
end

class AccountForm < Preform::Form
  attr_reader :email, :password

  def validate
    @email    = EmailField.new(:email, params['email'])
    @password = PasswordField.new(:password, params['password'])

    errors.merge!(email.errors)
    errors.merge!(password.errors)
  end

  def attributes
    { email: email.value, password_digest: password.digest }
  end
end

def assert_valid(form)
  assert form.valid?, "#{form} is not valid, it should be"
end

def refute_valid(form)
  assert !form.valid?, "#{form} is valid, it should not be"
end

def assert_errors_includes(form, key, msg)
  assert form.errors[key].include?(msg), "#{form.errors[key]} does not include #{msg}, it should"
end

setup do
  invalid_params = { 'email' => '', 'password' => '123456'}

  AccountForm.new(invalid_params)
end

test 'invalid form' do |form|
  refute_valid form

  assert_errors_includes form, :email, 'invalid format'

  assert_errors_includes form, :password, 'too short'
end

setup do
  valid_params = { 'email' => 'something@example.com', 'password' => 'sosecret' }

  AccountForm.new(valid_params)
end

test 'valid form' do |form|
  assert_valid form
end

