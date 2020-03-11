require 'rails_helper'

RSpec.feature "User can log in", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!( name: 'Lucy Midgley', 
      email: 'lucymidgley@email.com', 
      password: 'password',
      password_confirmation: 'password')
  end

  scenario "They can log in to their account" do
    # ACT
    visit root_path
    click_on('Login')
    sleep(1)
    within 'form' do
      fill_in id: 'email', with: 'lucymidgley@email.com'
      fill_in id: 'password', with: 'password'
      click_on 'Submit'
    end

    # DEBUG
    #save_screenshot
    sleep(1)

    # VERIFY
    expect(page).to have_text 'Signed in as Lucy Midgley'
    save_screenshot
    puts page.html
  end
end
