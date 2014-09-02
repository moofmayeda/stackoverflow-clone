require 'rails_helper'

describe Question do
  it { should have_many :responses }
  it { should belong_to :user }
end
