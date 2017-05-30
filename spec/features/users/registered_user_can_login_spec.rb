require "rails_helper"

RSpec.feature "As registered user" do
  it "can login" do

    user = create(:user)

    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"

    click_on "Login"
    expect(page).to have_content("Logged in as #{user.first_name}")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
  end
end