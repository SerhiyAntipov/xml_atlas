function room_start(object)
	
	object.onCreate = function(args)

		' ###
		' ### Load sprites
		atlas = ParseJson(ReadAsciiFile("pkg:/sprites/atlas.json"))
		bitmap = m.game.getBitmap("atlas")
		loading_images = TexturePacker_GetRegions(atlas, bitmap)

		' ###
		' ### XML parse
		url = CreateObject("roUrlTransfer")
		url = "pkg:/components/test_atlas.xml"

		component = CreateObject("roXMLElement")
		component.Parse(ReadAsciiFile(url))

		' ###
		' ### 
		component_children_nodes = component.GetChildNodes() 'work! ounly for test
		component_children_quantity = component_children_nodes.Count() 'work! ounly for test

		' =========================================================================
		' ###
		' ### Create clone All groups 
		' allGroups = component.children.scene.objects.GetChildElements()
				
		' ### 
		' ### Create clone All groups List
		' allGroups_nodes = component.children.scene.objects.GetChildNodes() ' not work !
		' allGroups_quantity = allGroups_nodes.Count()
		' ==========================================================================

		' ###
		' ### allGroups iteration 
		' ### Creating variables with data from attributes
		' ### Images will be created based on variable attributes
		sceneAttributes = component.children.scene.GetAttributes()

		groupAttributes_0 = component.children.scene.objects.group[0].GetAttributes()
			groupAttributes_0_object_0 = component.children.scene.objects.group[0].object[0].GetAttributes()
			groupAttributes_0_object_1 = component.children.scene.objects.group[0].object[1].GetAttributes()
			groupAttributes_0_object_2 = component.children.scene.objects.group[0].object[2].GetAttributes()
		groupAttributes_1 = component.children.scene.objects.group[1].GetAttributes()
			groupAttributes_1_object_0 = component.children.scene.objects.group[1].object[0].GetAttributes()
			groupAttributes_1_object_1 = component.children.scene.objects.group[1].object[1].GetAttributes()
		groupAttributes_2 = component.children.scene.objects.group[2].GetAttributes()
			groupAttributes_2_object_0 = component.children.scene.objects.group[2].object[0].GetAttributes()
			groupAttributes_2_object_1 = component.children.scene.objects.group[2].object[1].GetAttributes()
			groupAttributes_2_object_2 = component.children.scene.objects.group[2].object[2].GetAttributes()
		groupAttributes_3 = component.children.scene.objects.group[3].GetAttributes()
			groupAttributes_3_object_0 = component.children.scene.objects.group[3].object[0].GetAttributes()
			groupAttributes_3_object_1 = component.children.scene.objects.group[3].object[1].GetAttributes()
			groupAttributes_3_object_2 = component.children.scene.objects.group[3].object[2].GetAttributes()
		groupAttributes_4 = component.children.scene.objects.group[4].GetAttributes()
			groupAttributes_4_object_0 = component.children.scene.objects.group[4].object[0].GetAttributes()
			groupAttributes_4_object_1 = component.children.scene.objects.group[4].object[1].GetAttributes()
		
		' component.children.scene@size	
		' GetChildNodes()
		' GetBody() As Object
		' GetAttributes() As Object
		' GetName() As String
		' GetText() As String
		' GetChildElements() As Object
		' GetNamedElements(As String) As Object

	end function

	object.onDrawEnd = function(canvas)
		DrawText(canvas, "start xml", canvas.GetWidth() / 2, canvas.GetHeight() - 80, m.game.getFont("default"), "center", &hae7987FF)
	end function

end function