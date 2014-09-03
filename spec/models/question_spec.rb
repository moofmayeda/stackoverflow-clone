require 'rails_helper'

describe Question do
  it { should have_many :responses }
  it { should belong_to :user }
  it { should have_one :best_response }
end
