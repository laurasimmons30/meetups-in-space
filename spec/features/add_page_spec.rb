require 'spec_helper'

feature "User fills out form to add a new meetup group" do

# As a user
# I want to create a meetup
# So that I can gather a group of people to discuss a given topic

  scenario 'I have to fill in all details on form to add meetup' do
    visit 'index/add'
    fill_in('name', with: '')

    expect(page).to raise_error

    visit 'index/add'
    fill_in('name', with: 'Goth Picnics Star Chapter')
    fill_in('location', with: 'Venus')
    fill_in('description', with: 'Come hang with your dark homies and eat sandwiches')
    check('dating')
    click_button('Submit')

    expect(page).to have_content("Meetup Deeeeets")     
  end
end
