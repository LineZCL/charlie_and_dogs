require 'spec_helper'

describe Sale do
  it { should belong_to(:client) }
  it { should have_many(:item_sales) }
end
