feature 'user can update and delete exisitng listings' do
    scenario 'user can update a lisitng' do
        sign_up
        visit "/user/profile"
        click_link 'Add property'
        add_listing
        first('.listing').click_button 'Edit'
        fill_in 'name', with: 'Flat Iron'
        fill_in 'description', with: '60 Commercial Place'
        fill_in 'price', with: 166
        fill_in 'start_date', with: "2019-10-22"
        fill_in 'end_date', with: "2019-12-25"
        click_button 'Submit'
        expect(page).not_to have_content("Makers")
        expect(page).to have_content("Flat Iron")
        expect(page).to have_content("Tuesday 22nd Oct 2019")
        expect(page).to have_content("Wednesday 25th Dec 2019")
    end

    scenario 'user can delete a listing' do
        sign_up
        visit "/user/profile"
        click_link 'Add property'
        add_listing
        first('.listing').click_button 'Delete'
        expect(page).not_to have_content("Makers")
    end
end
