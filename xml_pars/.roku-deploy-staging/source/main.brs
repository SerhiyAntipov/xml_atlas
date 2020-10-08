sub Main()

	' ###
	' ### Initializes the game engine
	game = new_game(1280, 720, true) ' This initializes the game engine
	m.game = game
	
	' ###
	' ### load atlas
	' game.loadBitmap("atlas", "pkg:/sprites/atlas.png")


	' ### load room
	game.defineRoom("room_start", room_start)
	
	' ###
	' ### sellect room
	game.changeRoom("room_start")
		
	' ###
	' ### start game
	game.Play()
	
end sub