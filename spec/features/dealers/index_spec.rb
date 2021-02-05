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

    it 'Is sorted by most recently created, with created time shown' do
      dealer1 = create(:dealer, created_at: "01-01-2020")
      dealer2 = create(:dealer, created_at: "11-01-1990")
      dealer3 = create(:dealer, created_at: "08-01-1983")

      visit '/dealers'
      expect(dealer2.name).to appear_before(dealer3.name)
      expect(dealer1.name).to appear_before(dealer2.name)
      expect(dealer1.name).to appear_before(dealer3.name)
    end
  end
end
