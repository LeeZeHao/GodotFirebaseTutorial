extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Firebase.Auth.login_succeeded.connect(on_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(on_signup_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_signup_failed)
	
	if Firebase.Auth.check_auth_file():
		%StateLabel.text = "Logged in"
		get_tree().change_scene_to_file("res://Game.tscn")
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_login_button_pressed():
	var email = %EmailLineEdit.text
	var password = %PasswordLineEdit.text
	Firebase.Auth.login_with_email_and_password(email, password)
	%StateLabel.text = "Logging in..."
	pass # Replace with function body.


func _on_sign_up_button_pressed():
	var email = %EmailLineEdit.text
	var password = %PasswordLineEdit.text
	Firebase.Auth.signup_with_email_and_password(email, password)
	%StateLabel.text = "Signing up..."
	pass # Replace with function body.
	
func on_login_succeeded(auth):
	print(auth)
	%StateLabel.text = "Login Success!"
	Firebase.Auth.save_auth(auth)
	get_tree().change_scene_to_file("res://Game.tscn")
	pass
	
func on_signup_succeeded(auth):
	print(auth)
	%StateLabel.text = "Signup Success!"
	pass
	
func on_login_failed(error_code, message):
	print(error_code)
	print(message)
	%StateLabel.text = "Login failed. Error: %s" % message
	pass
	
func on_signup_failed(error_code, message):
	print(error_code)
	print(message)
	%StateLabel.text = "Login failed. Error: %s" % message
	pass
