# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?(target_user)' do
    user = User.create!(email: 'hoge@exmaple.com', password: 'password')
    report = Report.create!(user: user, title: 'hoge', content: 'fuga')

    report.editable?(user)
  end

  test '#created_on' do
    user = User.create!(email: 'hoge@exmaple.com', password: 'password')
    report = Report.create!(user: user, title: 'hoge', content: 'fuga')

    assert report.created_on.instance_of?(Date)
  end
end
