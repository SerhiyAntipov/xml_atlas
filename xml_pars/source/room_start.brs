function room_start(object)
	
	object.onCreate = function(args)

		m.game.createInstance( "xmlToBrsScene" , {src: "pkg:/components/test_atlas.xml"} )

	end function

end function