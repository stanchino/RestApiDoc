require 'spec_helper'

describe UsersSuite do
  context "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:suite) }
  end
end


