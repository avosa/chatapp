require 'rails_helper.rb'

feature 'Creating jobs' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Job'
    attach_file('Image', "spec/files/images/amazon.jpg")
    fill_in 'Title', with: 'Senior Software Developer #amazon'
    click_button 'Create Job'
    expect(page).to have_content('Senior Software Developer #amazon')
    expect(page).to have_css("img[src*='amazon.jpg']")
  end
end
