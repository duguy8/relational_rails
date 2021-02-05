require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/dealers"' do
    it 'I see every dealer' do
      dealer1 = create(:dealer)
      dealer2 = create(:dealer)
      dealer3 = create(:dealer)

      visit '/dealers'

      expect(page).to have_content(dealer1.name)
      expect(page).to have_content(dealer2.name)
      expect(page).to have_content(dealer3.name)
    end
  end
end
