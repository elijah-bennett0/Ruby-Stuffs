require 'socket'
print "Project name: "
project = gets.chomp
puts "Include '\\' at the end. Ex: C:\\Test\\"
print "Location to save project: "
location = gets.chomp
puts "[!] Creating project directory..."
sleep 2
system("mkdir " + location + project)
sleep 2
puts "[!] Creating log file..."
sleep 2
projectloc = location + project
log = File.new(projectloc + "\\Log.txt", "w+")
log.puts("[+] Project directory created")
log.puts("[+] Project log file created")
time = Time.new
log.puts("[!] Starting program at: #{time.inspect}")
sleep 2
print "Continue [1] or exit [2]: "
opt = gets.chomp
if (opt == "1") then
	puts "[!] Continue selected..."
	log.puts("[+] Continue selected")
	print "Enter your router ip: "
	router = gets.chomp
	puts "[!] Checking internet connection..."
	ping = `ping "#{router}"`
	log.puts("[!] Starting ping check...")
	log.puts("==============================================")
	log.puts(ping)
	log.puts("==============================================")
	log.puts("[+]  Ping check complete")
	puts "[!] Starting TCP server..."
	log.puts "[!] Starting TCP server..."
	sleep 2
	print "Port to use: "
	PORT = gets.chomp
	log.puts "[+] Port set to #{PORT}"
	socket = TCPServer.new('0.0.0.0', PORT)
	def handle_connection(client)
		puts "[+] Client recieved! | #{client}"
		log.puts "[+] Client recieved! | #{client}"
		client.write("[!] You are connected to the TCP Server!")
		log.puts "[!] Sent the message: '[!] You are connected to the TCP Server!' to the client"
		client.close
	end
	puts "[!] Listening on port: #{PORT}"
	log.puts "[!] Listening on port #{PORT}"
	while client = socket.accept
		Thread.new { handle_connection(client) }
	end
elsif (opt == "2") then
	puts "[!] Now exiting"
	log.puts("[+] Exit chosen and program is exiting at: #{time.inspect}")
else
	puts "[-] Not a valid option, now exiting..."
end