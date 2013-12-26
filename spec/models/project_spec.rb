require 'spec_helper'

describe Project do
  context "relations" do
    it { should have_many(:suites) }
    it { should have_many(:users_projects) }
    it { should have_many(:users).through(:users_projects) }
  end
  context "scopes" do
    it "should sort by title" do
      3.times do
        FactoryGirl.create :project
      end
      Project.where(true).to_a.should eq Project.order("title ASC").to_a
    end
  end
end
