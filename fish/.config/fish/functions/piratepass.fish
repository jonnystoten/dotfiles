function piratepass
  set --export PASSWORD_STORE_DIR ~/code/pirate-studios/store
  set --export PASSWORD_STORE_GIT ~/code/pirate-studios/store
  pass $argv
end
