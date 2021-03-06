package haxe.ui.toolkit.controls;

import flash.events.MouseEvent;
import haxe.ui.toolkit.core.interfaces.IFocusable;
import haxe.ui.toolkit.core.Screen;
import haxe.ui.toolkit.core.StateComponent;
import haxe.ui.toolkit.layout.Layout;
import haxe.ui.toolkit.style.Style;

/**
 General purpose multi-state button control with icon and toggle support (plus icon positioning)
 
 <b>Events:</b>
 
 * `MouseEvent.CLICK` - Dispatched when button is clicked
 **/
 
class Button extends StateComponent implements IFocusable {
	/**
	 Button state is "normal" (default state)
	 **/
	public static inline var STATE_NORMAL = "normal";
	/**
	 Button state is "over"
	 **/
	public static inline var STATE_OVER = "over";
	/**
	 Button state is "down"
	 **/
	public static inline var STATE_DOWN = "down";
	
	private var _allowFocus:Bool = true;
	private var _remainPressed:Bool = false; // if the button should remain pressed even when the mouse is out
	
	private var _label:Text;
	private var _icon:Image;
	
	private var _down:Bool = false;
	private var _toggle:Bool = false;
	private var _selected:Bool = false;
	private var _allowSelection:Bool = true;
	
	public function new() {
		super();
		sprite.buttonMode = true;
		sprite.useHandCursor = true;
		state = STATE_NORMAL;
		_layout = new ButtonLayout();
		_label = new Text();
		autoSize = true;
	}
	
	//******************************************************************************************
	// Properties
	//******************************************************************************************
	/**
	 Defines whether this button should remain pressed even when the mouse cursor goes out of the control (and the left mouse button is pressed)
	 **/
	public var remainPressed(get, set):Bool;
	/**
	 Sets the icon asset. Eg: `assets/myicon.png`
	 **/
	public var icon(get, set):String;
	
	private function get_remainPressed():Bool {
		return _remainPressed;
	}
	
	private function set_remainPressed(value:Bool):Bool {
		_remainPressed = value;
		return value;
	}
	
	private function get_icon():String {
		if (_icon == null) {
			return null;
		}
		return _icon.resource;
	}
	
	private function set_icon(value:String):String {
		if (_icon == null) {
			_icon = new Image();
			addChild(_icon);
		}
		_icon.resource = value;
		return value;
	}
	
	//******************************************************************************************
	// Overrides
	//******************************************************************************************
	private override function preInitialize():Void {
		super.preInitialize();
		resizeButton();
	}
	
	private override function initialize():Void {
		super.initialize();
		
		addChild(_label);

		addEventListener(MouseEvent.MOUSE_OVER, _onMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, _onMouseOut);
		addEventListener(MouseEvent.MOUSE_DOWN, _onMouseDown);
		addEventListener(MouseEvent.MOUSE_UP, _onMouseUp);
		addEventListener(MouseEvent.CLICK, _onMouseClick);
	}
	
	//******************************************************************************************
	// Component overrides
	//******************************************************************************************
	private override function get_text():String {
		return _label.text;
	}
	
	private override function set_text(value:String):String {
		value = super.set_text(value);
		_label.text = value;
		if (_ready) {
			resizeButton(true);
		}
		return value;
	}

	//******************************************************************************************
	// Event handlers
	//******************************************************************************************
	private function _onMouseOver(event:MouseEvent):Void {
		if (_selected == false) {
			if (event.buttonDown == false || _down == false) {
				state = STATE_OVER;
			} else {
				state = STATE_DOWN;
			}
		}
	}
	
	private function _onMouseOut(event:MouseEvent):Void {
		if (_selected == false) {
			if (_remainPressed == false || event.buttonDown == false) {
				state = STATE_NORMAL;
			} else {
				//Screen.instance.addEventListener(MouseEvent.MOUSE_UP, _onMouseUp);
			}
		}
	}
	
	private function _onMouseDown(event:MouseEvent):Void {
		if (_allowSelection == true) {
			_down = true;
			state = STATE_DOWN;
			Screen.instance.addEventListener(MouseEvent.MOUSE_UP, _onMouseUp);
		}
	}
	
	private function _onMouseUp(event:MouseEvent):Void {
		if (_allowSelection == true && toggle == false) {
			_down = false;
			if (hitTest(event.stageX, event.stageY)) {
				#if !(android)
					state = STATE_OVER;
				#else
					state = STATE_NORMAL;
				#end
			} else {
				state = STATE_NORMAL;
			}
			
			if (_remainPressed == true) {
				Screen.instance.removeEventListener(MouseEvent.MOUSE_UP, _onMouseUp);
			}
		}
	}
	
	private function _onMouseClick(event:MouseEvent):Void {
		if (_toggle == true && _allowSelection == true) {
			selected = !selected;
			#if !android
				if (selected == false && hitTest(event.stageX, event.stageY)) {
					state = STATE_OVER;
				}
			#end
		}
	}
	
	//******************************************************************************************
	// IState
	//******************************************************************************************
	private override function get_states():Array<String> {
		return [STATE_NORMAL, STATE_OVER, STATE_DOWN];
	}
	
	private override function set_state(value:String):String {
		super.set_state(value);
		if (value == STATE_DOWN) {
			_down = true;
		}
		return value;
	}
	
	//******************************************************************************************
	// IFocusable
	//******************************************************************************************
	/**
	 Defines whether or not the button can receive focus by tabbing to it (not yet implemented)
	 **/
	public var allowFocus(get, set):Bool;
	
	private function get_allowFocus():Bool {
		return _allowFocus;
	}
	
	private function set_allowFocus(value:Bool):Bool {
		return value;
	}
	
	//******************************************************************************************
	// Properties
	//******************************************************************************************
	/**
	 Defines where the icon (if available) should be positioned, valid values are:
		 
		 - `farLeft` - furthest left position possible (honours padding)
		 - `left` - left of the label
		 - `center` or `top` - centered in the button, if button has a label icon will be positioned ontop of the label
		 - `right` - right of the label
		 - `farRight` - furthest right position possible (honours padding)
	 **/
	public var iconPosition(get, set):String;
	/**
	 Defines whether this button should behave as a toggle button. Toggle buttons maintain thier selection, ie, one click to select, another to deselect
	 **/
	public var toggle(get, set):Bool;
	/**
	 Gets or sets the buttons selected state. Only applicable if the button is a toggle button.
	 **/
	public var selected(get, set):Bool;
	/**
	 Defines whether this buttons selected state can be modified by the user. Only applicable for toggle buttons.
	 **/
	public var allowSelection(get, set):Bool;
	
	private function get_iconPosition():String {
		return cast(_layout, ButtonLayout).iconPosition;
	}
	
	private function set_iconPosition(value:String):String {
		cast(_layout, ButtonLayout).iconPosition = value;
		return value;
	}
	
	private function get_toggle():Bool {
		return _toggle;
	}
	
	private function set_toggle(value:Bool):Bool {
		_toggle = value;
		return value;
	}
	
	private function get_selected():Bool {
		return _selected;
	}
	
	private function set_selected(value:Bool):Bool {
		_selected = value;
		if (_selected == true) {
			state = STATE_DOWN;
		} else {
			#if !(android)
				if (root != null && hitTest(root.mousePosition.x, root.mousePosition.y) == true) {
					state = STATE_OVER;
				} else {
					state = STATE_NORMAL;
				}
			#else
				state = STATE_NORMAL;
			#end
		}
		return value;
	}
	
	private function get_allowSelection():Bool {
		return _allowSelection;
	}
	
	private function set_allowSelection(value:Bool):Bool {
		_allowSelection = value;
		return value;
	}
	
	//******************************************************************************************
	// IStyleable
	//******************************************************************************************
	public override function applyStyle():Void {
		super.applyStyle();
		
		// apply style to label
		if (_label != null) {
			var labelStyle:Style = new Style();
			if (_style != null) {
				labelStyle.fontName = _style.fontName;
				labelStyle.fontSize = _style.fontSize;
				labelStyle.color = _style.color;
			}
			_label.style = labelStyle;
		}
		
		if (_style != null) {
			if (_style.icon != null) {
				icon = _style.icon;
			}
			
			if (_style.iconPosition != null) {
				cast(_layout, ButtonLayout).iconPosition = _style.iconPosition;
			}

			if (_style.labelPosition != null) {
				cast(_layout, ButtonLayout).labelPosition = _style.labelPosition;
			}
		}
	}
	
	//******************************************************************************************
	// Helpers
	//******************************************************************************************
	private function resizeButton(force:Bool = false):Void {
		if (text.length > 0 && autoSize == true) {
			var buttonLayout:ButtonLayout = cast(_layout, ButtonLayout);
			if (width == 0 || force == true) {
				var cx:Float = _label.width + _layout.padding.left + _layout.padding.right;
				if (_icon != null) {
					if (buttonLayout.iconPosition == "farLeft" || buttonLayout.iconPosition == "left" || buttonLayout.iconPosition == "right" || buttonLayout.iconPosition == "farRight") {
						cx += _icon.width + _layout.padding.left + _layout.padding.right;
					}
				}
				width = cx;
			}
			if (height == 0 || force == true) {
				var cy:Float = _label.height + _layout.padding.top + _layout.padding.bottom;
				height = cy;
			}
		}
	}
}

private class ButtonLayout extends Layout {
	private var _iconPos:String = "center";
	private var _labelPos:String = "center";
	
	public function new() {
		super();
	}
	
	//******************************************************************************************
	// Getters/setters
	//******************************************************************************************
	public var iconPosition(get, set):String;
	public var labelPosition(get, set):String;
	
	private function get_iconPosition():String {
		return _iconPos;
	}
	
	private function set_iconPosition(value:String):String {
		_iconPos = value;
		return value;
	}
	
	private function get_labelPosition():String {
		return _labelPos;
	}
	
	private function set_labelPosition(value:String):String {
		_labelPos = value;
		return value;
	}
	
	//******************************************************************************************
	// ILayout
	//******************************************************************************************
	private override function repositionChildren():Void {
		super.repositionChildren();
		
		var labelX:Float = 0;
		var labelY:Float = 0;
		var imageX:Float = 0;
		var imageY:Float = 0;
		
		var label:Text = container.findChildAs(Text);
		var icon:Image = container.findChildAs(Image);

		if (label != null) {
			if (_labelPos == "center") {
				labelX = (container.width / 2) - (label.width / 2);
				labelY = (container.height / 2) - (label.height / 2);
			} else if (_labelPos == "left") {
				labelX = padding.left;
				labelY = (container.height / 2) - (label.height / 2);
				if (icon != null && (_iconPos == "left" || _iconPos == "farLeft")) {
					labelX += icon.width + 5;
				}
			}
		}
		
		if (icon != null) {
			if (_iconPos == "left") {
				imageX = labelX - icon.width;
				imageY = (container.height / 2) - (icon.height / 2);
			} else if (_iconPos == "right") {
				imageX = labelX;
				if (label != null) {
					imageX += label.width;
				}
				imageY = (container.height / 2) - (icon.height / 2);
			} else if (_iconPos == "farLeft") {
				imageX = padding.left;
				imageY = (container.height / 2) - (icon.height / 2);
			} else if (_iconPos == "farRight") {
				imageX = container.width - icon.width - padding.right;
				imageY = (container.height / 2) - (icon.height / 2);
			} else if (_iconPos == "top" || _iconPos == "center") {
				imageX = (container.width / 2) - (icon.width / 2);
				var combinedHeight = icon.height;
				if (label != null) {
					combinedHeight += label.height;
				}
				imageY = (container.height / 2) - (combinedHeight / 2);
				labelY = imageY + icon.height;
			}
		}
		
		if (label != null) {
			label.x = labelX;
			label.y = labelY;
		}
		
		if (icon != null) {
			icon.x = imageX;
			icon.y = imageY;
		}
	}
}