require 'spec_helper'

feature "User fills out form to add a new meetup group" do

# As a user
# I want to create a meetup
# So that I can gather a group of people to discuss a given topic

  scenario 'I have to fill in all details on form to add meetup' do
    visit '/index/add'
    fill_in 'Name', with: ''

    expect(page).to raise_error

    visit '/index/add'
    fill_in('Name', with: 'Goth Picnics Star Chapter')
    fill_in('Location of the Meetup:', with: 'Venus')
    fill_in('Description of the Meetup:', with: 'Come hang with your dark homies and eat sammies')
    check('Fitness')
    click_button('Submit')

    expect(page).to have_content("Meetup Deeeeets")     
  end
end
