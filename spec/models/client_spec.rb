require 'spec_helper'

describe Client do
  it { should have_many(:sales) }
end
