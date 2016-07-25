def sign_in
  visit('/')
  fill_in :player_1, with: "Aga"
  fill_in :player_2, with: ""
  click_button "Play"
end
