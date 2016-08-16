def login_user(user)
	puts "**************************"
	allow(request.env['warden']).to receive(:authenticate!) { user }
	allow(controller).to receive(:current_user) { user }
end