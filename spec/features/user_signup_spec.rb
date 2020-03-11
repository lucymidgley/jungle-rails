require 'rails_helper'

RSpec.feature "User can log in", type: :feature, js: true do

  xscenario "User can sign up" do
    # ACT
    visit root_path
    click_on('Signup')
    sleep(1)
    within 'form' do
      fill_in id: 'user_name', with: 'Lucy New'
      fill_in id: 'user_email', with: 'lucymidgleynew@email.com'
      fill_in id: 'user_password', with: 'password'
      fill_in id: 'user_password_confirmation', with: 'password'
      click_on 'Submit'
    end

    # DEBUG
    #save_screenshot
    sleep(1)

    # VERIFY
    expect(page).to have_text 'Signed in as Lucy New'
    save_screenshot
    #puts page.html
  end
  xscenario "User cannot sign up with incorrect details" do
    # ACT
    visit root_path
    click_on('Signup')
    sleep(1)
    within 'form' do
      fill_in id: 'user_name', with: ''
      fill_in id: 'user_email', with: 'lucymidgleynew@email.com'
      fill_in id: 'user_password', with: 'password'
      fill_in id: 'user_password_confirmation', with: 'password'
      click_on 'Submit'
    end

    # DEBUG
    #save_screenshot
    sleep(1)

    # VERIFY
    expect(page).to have_text 'The following errors prevented saving'
    save_screenshot
    #puts page.html
  end
end

