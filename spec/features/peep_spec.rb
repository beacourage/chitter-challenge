feature "Peeps" do

  let!(:user) { User.create(
               :name => "Beatrice",
               :username => "beacourage",
               :email => "bea@bea.com",
               :password => "hello12345"
                )}

  let(:email) {'bea@bea.com'}
  let(:password){'hello12345'}

  scenario "User can post a messages to chitter" do
    sign_in(email, password)
    fill_in "peep", with: "This is my first peep"
    click_button "Send peep!"
    expect(page).to have_content "This is my first peep"
  end

  scenario "User can post multiple messaeges to chitter" do
    sign_in(email, password)
    expect(page.current_path).to eql '/profile'
    fill_in "peep", with: "First message"
    click_button "Send peep!"
    fill_in "peep", with: "Second message"
    click_button "Send peep!"
    expect(page).to have_content "First message"
    expect(page).to have_content "Second message"
  end
end
