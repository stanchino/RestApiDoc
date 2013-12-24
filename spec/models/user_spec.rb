require 'spec_helper'

describe User do
  context "relations" do
    it { should have_many(:projects) }
    it { should have_many(:suites) }
  end
end
