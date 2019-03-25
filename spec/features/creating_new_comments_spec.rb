require 'rails_helper'

feature 'Creating comments' do
  background do
    user = create :user
    @post = create(:post, user_id: user.id)
    sign_in_with user
  end

  scenario 'can comment on an existing post' do
    visit '/'

    fill_in 'comment[content]', with: ';P'
    click_button 'Submit'

    expect(page).to have_content(';P')
  end
end