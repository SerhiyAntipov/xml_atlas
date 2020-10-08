function xmlToBrsScene(object)
	object.group_data = []
	object.object_data = []
	' params.src = object.data.src

	object.onCreate = function(args)

		' ###
		' ### XML parse
		url = CreateObject("roUrlTransfer")
		url = "pkg:/components/test_atlas.xml"

		component = CreateObject("roXMLElement")
		component_xml = ReadAsciiFile(url)
		component.Parse(component_xml)

		sceneAttributes = component.children.scene.GetAttributes()
		' ###
		' ### Get by Name Elements from XML
		xml_group = component.children.scene.objects.GetNamedElements("group")
		
		' ###
		' ### Get atribute from XML
		for each item in xml_group
            attributes = item.GetAttributes()
            m.group_data.Push({ id : attributes["id"] })
        end for

		for i = 0 to m.group_data.Count()-1 step i + 1
			object_data = xml_group[i].GetNamedElements("object")
			
			dataTemp = 0 'for test (ounly to divide into groups of pictures)
			for each item in object_data
				dataTemp++ 
	
				attributes = item.GetAttributes()
				m.object_data.Push({ id : attributes["id"], offset : attributes["offset"], size : attributes["size"], type : attributes["type"], image_id : attributes["image_id"], alpha : attributes["alpha"] })
			end for
		end for

		' ###
		' ### Create scene
		m.object_data.Reverse()
		for each item in m.object_data
			
			' ### Create Bitmap
			m.game.loadBitmap( item["id"].ToStr(), "pkg:/sprites/"+item["image_id"])

			bitmapName = item["id"].ToStr()
			
			bitmapName = m.game.getBitmap(item["id"].ToStr())
			width = bitmapName.GetWidth()
			height = bitmapName.GetHeight()
			alpha_value = item["alpha"].ToInt()
			offset = item["offset"].Split(" ")
			offset_x_value = offset[0].ToInt()
			offset_y_value = offset[1].ToInt()
			
			region = CreateObject("roRegion", bitmapName, 0, 0, width, height)
			m.addImage( item["id"].ToStr() , region,{ offset_x: offset_x_value , offset_y: offset_y_value, alpha: alpha_value })
		end for

	end function

end function