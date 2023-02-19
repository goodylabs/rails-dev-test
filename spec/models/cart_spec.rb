require "rails_helper"

RSpec.describe Cart, type: :model do
  it { should have_many(:line_items).dependent(:destroy) }
  it { should have_many(:products).through(:line_items) }
end
