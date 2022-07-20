// ================================================================================
// Moves the received items to it's marker output position, then deletes itself
// ================================================================================
class sargeOutputMarker extends sargeOutput
{
	//If an item has a contains link, it should be cloned so that it actually works when placed in the world
	function CloneContainedItem(item)
	{
		//If item is contained, we need to clone it and delete the old one
		if (Link.AnyExist(linkkind("~Contains"),item))
		{
			local item2 = Object.Create(item);
			Object.Destroy(item);
			print (item + " cloned to new item " + item2);
			item = item2;
		}
		return item;
	}

	function ProcessItem(item)
	{
		item = CloneContainedItem(item);
		print ("moving item " + item + " to position " + Object.Position(self));
		Object.Teleport(item, Object.Position(self), Object.Facing(self));
	}
}