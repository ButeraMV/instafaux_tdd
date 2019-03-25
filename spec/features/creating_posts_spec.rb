require 'rails_helper'

feature 'Creating posts' do
  background do
    user = create(:user)
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'

    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Dab on the haters'
    click_button 'Create Post'
    expect(page).to have_content('Your post could not be created.')
  end
end