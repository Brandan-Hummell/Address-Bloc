require_relative 'controllers/menu_controller.rb'

menu = MenuController.new

system "clear"
p "Welcome to Address Bloc!"

menu.main_menu