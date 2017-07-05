if @user.nil?
	node("message"){"Available"}
else
	node("message"){"Email already taken"}
end