class AuthenticateUser
  prepend SimpleCommand
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken .encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user_obj = User.find_by_email(email)

    return user_obj if user_obj && user_obj.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
