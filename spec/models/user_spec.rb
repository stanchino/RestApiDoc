require 'spec_helper'

describe User do
  context "relations" do
    it { should have_many(:projects) }
    it { should have_many(:suites) }
  end
  context "methods" do
    before do
      @user = FactoryGirl.create :user
    end
    it "should return the latest project" do
      3.times do |i|
        @user.projects.create(title: "Project #{i}", updated_at: (i+1).days.ago)
      end
      @user.latest_project.should eq(Project.recent.last)
    end
  end
end
