json.array!(@users) do |user|
  json.extract! user, :id, :username, :realname, :admin, :irc_nick, :email, :student_number
end