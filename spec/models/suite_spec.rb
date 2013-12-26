require 'spec_helper'

describe Suite do
  context "relations" do
    it { should belong_to(:project) }
    it { should have_many(:pages) }
    it { should have_many(:users_suites) }
    it { should have_many(:users).through(:users_suites) }
  end
  context "scopes" do
    it "should sort by order" do
      3.times do
        FactoryGirl.create :suite
      end
      Suite.where(true).to_a.should eq Suite.order('"order" ASC').to_a
    end
  end
end
