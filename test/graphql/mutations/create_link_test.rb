require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, field: nil, context: { current_user: user }).resolve(args)
  end

  def create_user
    User.create!(
      name: 'Test User',
      email: 'email@example.com',
      password: '[omitted]',
    )
  end

  test 'create a new link' do
    user = create_user

    link = perform(
      url: 'http://example.com',
      description: 'description',
      user: user
    )

    assert link.persisted?
    assert_equal link.description, 'description'
    assert_equal link.url, 'http://example.com'
    assert_equal link.user, user
  end
end
