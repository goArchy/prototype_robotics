require 'spec_helper'

describe Article do
  it { should belong_to(:spree_user) }
  it { should have_many(:galleries) }
end
