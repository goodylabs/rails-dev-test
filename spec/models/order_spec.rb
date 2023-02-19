require "rails_helper"

RSpec.describe Order, type: :model do
  it { should have_many(:line_items).dependent(:destroy) }
end
