require 'spec_helper'

describe UsersProject do
  context "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:project) }
  end
end

