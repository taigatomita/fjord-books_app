# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?(target_user)' do
    user = users(:alice)
    report = reports(:calendar)

    report.editable?(user)
  end

  test '#created_on' do
    report = reports(:calendar)

    assert report.created_on.instance_of?(Date)
  end
end
