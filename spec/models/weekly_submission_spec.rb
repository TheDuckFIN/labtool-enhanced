require 'rails_helper'

RSpec.describe WeeklySubmission, type: :model do

  before :each do
    @week = FactoryGirl.create :week
  end

  it 'does not allow points to exceed week maximum' do
    submission = WeeklySubmission.new week:@week, points:5

    expect(submission.save).to be(false)
    expect(WeeklySubmission.count).to eq(0)
  end

  it 'does not allow points to be negative' do
    submission = WeeklySubmission.new week:@week, points:-2

    expect(submission.save).to be(false)
    expect(WeeklySubmission.count).to eq(0)
  end

end
