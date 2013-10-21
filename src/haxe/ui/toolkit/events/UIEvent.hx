package haxe.ui.toolkit.events;

import flash.events.Event;
import haxe.ui.toolkit.core.interfaces.IDisplayObject;

/**
 * ...
 * @author deep <system.grand@gmail.com>
 */
class UIEvent extends Event
{
	static public inline var INIT:String = "init";
	static public inline var RESIZE:String = "resize";

	public var displayObject:IDisplayObject;
	
	public function new(type:String, bubbles:Bool=false, cancelable:Bool=false) 
	{
		super(type, bubbles, cancelable);
	}
	
	override public function clone():Event {
		var res = new UIEvent(type, bubbles, cancelable);
		res.displayObject = displayObject;
		return res;
	}
	
}