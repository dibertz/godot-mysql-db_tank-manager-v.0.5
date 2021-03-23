
# /* Source CODE MySQL / GODOT by_DIEGOT PRODUCTIONS
# * *
# * DDTank Online v.3.1 - SERVER_S1: Luna de Sombra
# */

extends Control

# // Set up your MySQL inputs 
onready var player = $Panel/PanelContainer/Form/TR/TableContainer/user_name
onready var level = $Panel/PanelContainer/Form/TR/TableContainer/user_level
onready var voucher = $Panel/PanelContainer/Form/TR/TableContainer/user_coupons
onready var money = $Panel/PanelContainer/Form/TR/TableContainer/user_cash

onready var submit = $Panel/PanelContainer/Form/TR/Submit

func _ready():
	query()

func _on_request_completed(result, response_code, headers, body):
	
	"' Requests to the server : Query into MySQL database '"
	
	if result != HTTPRequest.RESULT_SUCCESS:
		printerr("Error w/ connection: " + String(result))
	
	var response_content
	
	if response_code == 200:
		
		response_content = body.get_string_from_utf8()
		
		if response_content.find("{") >= 0:
			var bin = GDScript.new()
			bin.set_source_code("func val(): return" + response_content)
			bin.reload()
		
			var json = Reference.new()
			json.set_script(bin)
		
			var user_login = ""
			var user_level= ""
			var user_voucher = ""
			var user_money = ""
			
			for i in json.val():
				#user_money += "\n" + str(json.val()[i])
				if i == 'Player':
					user_login += "\n" +  str(json.val()[i])
				if i == 'Nivel':
					user_level += "\n" +  str(json.val()[i])
				if i == 'Cupones':
					user_voucher += "\n" +  str(json.val()[i])
				if i == 'Dinero':
					user_money += "\n" +  str(json.val()[i])
			
			player.set_text(user_login)
			level.set_text(user_level)
			voucher.set_text(user_voucher)
			money.set_text(user_money)
	
	else:
		
		printerr("Problem connection to server: ", response_content)

func query():
	
	var url = "http://localhost/PhpProject/public_html/DDTank_v.3.1/Client/auth.php?action=query"
	$HTTPS_GET.request(url)

# // Retry connection and refresh list
func _retry_connection():
	query()

func _make_post_request(_result, _response_code, _headers, body):
	
	submit.set_disabled(false)
	
	var content = body.get_string_from_utf8()
	printt(content)

func _submit():
	
	"' Requests to the server : Insert into MySQL '"
	
	submit.set_disabled(true)

	var url = "http://localhost/PhpProject/public_html/DDTank_v.3.1/Client/auth.php?action=register&player=" + player.get_text() + "&cash=" + money.get_text()
	
	# // Sending resources
	$HTTPS_POST.request(url)
	
	# // Form cleaned
	player.set_text("")
	level.set_text("")
	voucher.set_text("")
	money.set_text("")



func _on_Online_toggled(button_pressed):
	
	"' Permission credentials : SUDO '"
	
	if $Panel/PanelContainer/Form/TR/Online.pressed != true:
		OS.alert('Warning: SUDO mode disabled.')
		submit.set_disabled(true)
		player.set_editable(false)
		voucher.set_editable(false)
		money.set_editable(false)
		
	else:
		OS.alert('Warning: SUDO mode enabled.')
		submit.set_disabled(false)
		player.set_editable(true)
		voucher.set_editable(true)
		money.set_editable(true)
