require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Now THIS is podracing!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated.")
    expect(page).to have_content("Now THIS is podracing!")
  end

  xit "won't update a post without an image" do
    attach_file('Image', 'spec/files/coffee.txt')
    click_button 'Update Post'

    expect(page).to have_content("Update failed. Please check the form.")
  end
end