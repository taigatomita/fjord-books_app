# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = users(:alice)
    assert_equal 'alice@example.com', user.name_or_email

    user.name = 'alice'
    assert_equal 'alice', user.name_or_email
  end

  test '#follow' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test '#unfollow' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end
end
