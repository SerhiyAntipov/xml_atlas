function room_start(object)
	object.group_data = []
	object.object_data = []

	object.onCreate = function(args)
		m.game.createInstance( "xmlToBrsScene" , {src:1} )


	end function

end function