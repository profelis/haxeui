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
	
	static public inline var CLICK:String = "uiClick";
	static public inline var MOUSE_DOWN:String = "uiMouseDown";
	static public inline var MOUSE_UP:String = "uiMouseUp";
	static public inline var MOUSE_OVER:String = "uiMouseOver";
	static public inline var MOUSE_OUT:String = "uiMouseOut";
	static public inline var MOUSE_MOVE:String = "uiMouseMove";
	static public inline var DOUBLE_CLICK:String = "uiDoubleClick";
	static public inline var ROLL_OVER:String = "uiRollOver";
	static public inline var ROLL_OUT:String = "uiRollOut";
	
	static public inline var ADDED:String = "uiAdded";
	static public inline var ADDED_TO_STAGE:String = "uiAddedToStage";
	static public inline var REMOVED:String = "uiRemoved";
	static public inline var REMOVED_FROM_STAGE:String = "uiRemovedFromStage";
	static public inline var ACTIVATE:String = "uiActivate";
	static public inline var DEACTIVATE:String = "uiDeactivate";

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