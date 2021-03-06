package haxe.ui.toolkit.style;

import flash.filters.BitmapFilter;
import flash.geom.Rectangle;
import haxe.ui.toolkit.core.interfaces.IDisplayObject;
import haxe.ui.toolkit.core.StyleableDisplayObject;

class Style {
	private var _target:IDisplayObject;
	private var _autoApply:Bool = true;
	
	private var _width:Int = -1;
	private var _height:Int = -1; 
	private var _percentWidth:Int = -1; 
	private var _percentHeight:Int = -1;
	private var _backgroundImage:String;
	private var _backgroundImageScale9:Rectangle;
	private var _backgroundImageRect:Rectangle;
	private var _backgroundColor:Int = -1;
	private var _backgroundColorGradientEnd:Int = -1;
	private var _borderColor:Int = -1;
	private var _borderSize:Int = -1;
	private var _color:Int = -1;
	private var _paddingLeft:Int = -1;
	private var _paddingRight:Int = -1;
	private var _paddingTop:Int = -1;
	private var _paddingBottom:Int = -1;
	private var _spacingX:Int = -1;
	private var _spacingY:Int = -1;
	private var _cornerRadiusTopLeft:Int = -1;
	private var _cornerRadiusTopRight:Int = -1;
	private var _cornerRadiusBottomLeft:Int = -1;
	private var _cornerRadiusBottomRight:Int = -1;
	private var _filter:BitmapFilter;
	private var _filterSet:Bool = false;
	private var _alpha:Float = -1;
	private var _fontName:String;
	private var _fontSize:Int = -1;
	private var _iconPosition:String;
	private var _labelPosition:String;
	private var _icon:String;
	private var _hasButtons:Int = -1;
	private var _gradientType:String;
	private var _selectionMethod:String;
	private var _autoHideScrolls:Int = -1;
	private var _inlineScrolls:Int = -1;

	public var width(get, set):Int;
	public var height(get, set):Int;
	public var percentWidth(get, set):Int;
	public var percentHeight(get, set):Int;
	public var backgroundImage(get, set):String;
	public var backgroundImageScale9(get, set):Rectangle;
	public var backgroundImageRect(get, set):Rectangle;
	public var backgroundColor(get, set):Int;
	public var backgroundColorGradientEnd(get, set):Int;
	public var borderColor(get, set):Int;
	public var borderSize(get, set):Int;
	public var color(get, set):Int;
	public var paddingLeft(get, set):Int;
	public var paddingRight(get, set):Int;
	public var paddingTop(get, set):Int;
	public var paddingBottom(get, set):Int;
	public var padding(get, set):Int;
	public var spacingX(get, set):Int;
	public var spacingY(get, set):Int;
	public var spacing(get, set):Int;
	public var cornerRadiusTopLeft(get, set):Int;
	public var cornerRadiusTopRight(get, set):Int;
	public var cornerRadiusBottomLeft(get, set):Int;
	public var cornerRadiusBottomRight(get, set):Int;
	public var cornerRadius(get, set):Int;
	public var filter(get, set):BitmapFilter;
	public var alpha(get, set):Float;
	public var fontName(get, set):String;
	public var fontSize(get, set):Int;
	public var iconPosition(get, set):String;
	public var labelPosition(get, set):String;
	public var icon(get, set):String;
	public var hasButtons(get, set):Bool;
	public var gradientType(get, set):String;
	public var selectionMethod(get, set):String;
	public var autoHideScrolls(get, set):Bool;
	public var inlineScrolls(get, set):Bool;
	
	public var target(get, set):IDisplayObject;
	public var autoApply(get, set):Bool;
	
	public function new(defaults:Dynamic = null) {
		for (field in Reflect.fields(defaults)) {
			if (Reflect.getProperty(this, "set_" + field) != null) {
				Reflect.setProperty(this, field, Reflect.field(defaults, field));
			}
		}
	}

	private function get_target():IDisplayObject {
		return _target;
	}
	
	private function set_target(value:IDisplayObject):IDisplayObject {
		_target = value;
		apply();
		return value;
	}
	
	private function get_autoApply():Bool {
		return _autoApply;
	}
	
	private function set_autoApply(value:Bool):Bool {
		_autoApply = value;
		return value;
	}
	
	private function get_width():Int {
		return _width;
	}
	
	private function set_width(value:Int):Int {
		if (value != _width) {
			_width = value;
			apply();
		}
		return value;
	}

	private function get_height():Int {
		return _height;
	}
	
	private function set_height(value:Int):Int {
		if (value != _height) {
			_height = value;
			apply();
		}
		return value;
	}
	
	private function get_percentWidth():Int {
		return _percentWidth;
	}
	
	private function set_percentWidth(value:Int):Int {
		if (value != _percentWidth) {
			_percentWidth = value;
			apply();
		}
		return value;
	}

	private function get_percentHeight():Int {
		return _percentHeight;
	}
	
	private function set_percentHeight(value:Int):Int {
		if (value != _percentHeight) {
			_percentHeight = value;
			apply();
		}
		return value;
	}
	
	private function get_backgroundImage():String {
		return _backgroundImage;
	}
	
	private function set_backgroundImage(value:String):String {
		if (value != _backgroundImage) {
			_backgroundImage = value;
			apply();
		}
		return value;
	}

	private function get_backgroundImageScale9():Rectangle {
		return _backgroundImageScale9;
	}
	
	private function set_backgroundImageScale9(value:Rectangle):Rectangle {
		if (value != _backgroundImageScale9) {
			_backgroundImageScale9 = value;
			apply();
		}
		return value;
	}

	private function get_backgroundImageRect():Rectangle {
		return _backgroundImageRect;
	}
	
	private function set_backgroundImageRect(value:Rectangle):Rectangle {
		if (value != _backgroundImageRect) {
			_backgroundImageRect = value;
			apply();
		}
		return value;
	}
	
	private function get_backgroundColor():Int {
		return _backgroundColor;
	}
	
	private function set_backgroundColor(value:Int):Int {
		if (value != _backgroundColor) {
			_backgroundColor = value;
			apply();
		}
		return value;
	}

	private function get_backgroundColorGradientEnd():Int {
		return _backgroundColorGradientEnd;
	}
	
	private function set_backgroundColorGradientEnd(value:Int):Int {
		if (value != _backgroundColorGradientEnd) {
			_backgroundColorGradientEnd = value;
			apply();
		}
		return value;
	}
	
	private function get_borderColor():Int {
		return _borderColor;
	}
	
	private function set_borderColor(value:Int):Int {
		if (value != _borderColor) {
			_borderColor = value;
			apply();
		}
		return value;
	}

	private function get_borderSize():Int {
		return _borderSize;
	}
	
	private function set_borderSize(value:Int):Int {
		if (value != _borderSize) {
			_borderSize = value;
			apply();
		}
		return value;
	}

	private function get_color():Int {
		return _color;
	}
	
	private function set_color(value:Int):Int {
		if (value != _color) {
			_color = value;
			apply();
		}
		return value;
	}

	private function get_paddingLeft():Int {
		return _paddingLeft;
	}
	
	private function set_paddingLeft(value:Int):Int {
		if (value != _paddingLeft) {
			_paddingLeft = value;
			apply();
		}
		return value;
	}

	private function get_paddingRight():Int {
		return _paddingRight;
	}
	
	private function set_paddingRight(value:Int):Int {
		if (value != _paddingRight) {
			_paddingRight = value;
			apply();
		}
		return value;
	}
	
	private function get_paddingTop():Int {
		return _paddingTop;
	}
	
	private function set_paddingTop(value:Int):Int {
		if (value != _paddingTop) {
			_paddingTop = value;
			apply();
		}
		return value;
	}
	
	private function get_paddingBottom():Int {
		return _paddingBottom;
	}
	
	private function set_paddingBottom(value:Int):Int {
		if (value != _paddingBottom) {
			_paddingBottom = value;
			apply();
		}
		return value;
	}

	private function get_padding():Int {
		return cast(_paddingLeft | _paddingRight | _paddingTop | _paddingBottom, Int);
	}
	
	private function set_padding(value:Int):Int {
		if (value != _paddingLeft || value != _paddingRight || value != _paddingTop || value != _paddingBottom) {
			_paddingLeft = value;
			_paddingRight = value;
			_paddingTop = value;
			_paddingBottom = value;
			apply();
		}
		return value;
	}
	
	private function get_spacingX():Int {
		return _spacingX;
	}
	
	private function set_spacingX(value:Int):Int {
		if (value != _spacingX) {
			_spacingX = value;
			apply();
		}
		return value;
	}

	private function get_spacingY():Int {
		return _spacingY;
	}
	
	private function set_spacingY(value:Int):Int {
		if (value != _spacingY) {
			_spacingY = value;
			apply();
		}
		return value;
	}
	
	private function get_spacing():Int {
		return _spacingX | _spacingY;
	}
	
	private function set_spacing(value:Int):Int {
		if (value != _spacingX || value != _spacingY) {
			_spacingX = value;
			_spacingY = value;
			apply();
		}
		return value;
	}
	
	private function get_cornerRadiusTopLeft():Int {
		return _cornerRadiusTopLeft;
	}
	
	private function set_cornerRadiusTopLeft(value:Int):Int {
		if (value != _cornerRadiusTopLeft) {
			_cornerRadiusTopLeft = value;
			apply();
		}
		return value;
	}

	private function get_cornerRadiusTopRight():Int {
		return _cornerRadiusTopRight;
	}
	
	private function set_cornerRadiusTopRight(value:Int):Int {
		if (value != _cornerRadiusTopRight) {
			_cornerRadiusTopRight = value;
			apply();
		}
		return value;
	}
	
	private function get_cornerRadiusBottomLeft():Int {
		return _cornerRadiusBottomLeft;
	}
	
	private function set_cornerRadiusBottomLeft(value:Int):Int {
		if (value != _cornerRadiusBottomLeft) {
			_cornerRadiusBottomLeft = value;
			apply();
		}
		return value;
	}

	private function get_cornerRadiusBottomRight():Int {
		return _cornerRadiusBottomRight;
	}
	
	private function set_cornerRadiusBottomRight(value:Int):Int {
		if (value != _cornerRadiusBottomRight) {
			_cornerRadiusBottomRight = value;
			apply();
		}
		return value;
	}

	private function get_cornerRadius():Int {
		return _cornerRadiusTopLeft | _cornerRadiusTopRight | _cornerRadiusBottomLeft | _cornerRadiusBottomRight;
	}
	
	private function set_cornerRadius(value:Int):Int {
		if (value != _cornerRadiusTopLeft || value != _cornerRadiusTopRight || value != _cornerRadiusBottomLeft || value != _cornerRadiusBottomRight) {
			_cornerRadiusTopLeft = value;
			_cornerRadiusTopRight = value;
			_cornerRadiusBottomLeft = value;
			_cornerRadiusBottomRight = value;
			apply();
		}
		return value;
	}
	
	private function get_filter():BitmapFilter {
		return _filter;
	}
	
	private function set_filter(value:BitmapFilter):BitmapFilter {
		_filterSet = true;
		if (value != _filter) {
			_filter = value;
			apply();
		}
		return _filter;
	}
	
	private function get_alpha():Float {
		return _alpha;
	}
	
	private function set_alpha(value:Float):Float {
		if (value != _alpha) {
			_alpha = value;
			apply();
		}
		return value;
	}
	
	private function get_fontName():String {
		return _fontName;
	}
	
	private function set_fontName(value:String):String {
		if (value != _fontName) {
			_fontName = value;
			apply();
		}
		return value;
	}
	
	private function get_fontSize():Int {
		return _fontSize;
	}
	
	private function set_fontSize(value:Int):Int {
		if (value != _fontSize) {
			_fontSize = value;
			apply();
		}
		return value;
	}
	
	private function get_iconPosition():String {
		return _iconPosition;
	}
	
	private function set_iconPosition(value:String):String {
		if (value != _iconPosition) {
			_iconPosition = value;
			apply();
		}
		return value;
	}

	private function get_labelPosition():String {
		return _labelPosition;
	}
	
	private function set_labelPosition(value:String):String {
		if (value != _labelPosition) {
			_labelPosition = value;
			apply();
		}
		return value;
	}
	
	private function get_icon():String {
		return _icon;
	}
	
	private function set_icon(value:String):String {
		if (value != _icon) {
			_icon = value;
			apply();
		}
		return value;
	}

	private function get_hasButtons():Bool {
		if (_hasButtons == -1) {
			return true;
		}
		return _hasButtons == 1;
	}
	
	private function set_hasButtons(value:Bool):Bool {
		_hasButtons = value ? 1 : 0;
		apply();
		return value;
	}
	
	private function get_gradientType():String {
		return _gradientType;
	}
	
	private function set_gradientType(value:String):String {
		if (value != _gradientType) {
			_gradientType = value;
			apply();
		}
		return value;
	}

	private function get_selectionMethod():String {
		return _selectionMethod;
	}
	
	private function set_selectionMethod(value:String):String {
		if (value != _selectionMethod) {
			_selectionMethod = value;
			apply();
		}
		return value;
	}

	private function get_autoHideScrolls():Bool {
		if (_autoHideScrolls == -1) {
			return false;
		}
		return (_autoHideScrolls == 1);
	}
	
	private function set_autoHideScrolls(value:Bool):Bool {
		_autoHideScrolls = value ? 1 : 0;
		apply();
		return value;
	}

	private function get_inlineScrolls():Bool {
		if (_inlineScrolls == -1) {
			return false;
		}
		return (_inlineScrolls == 1);
	}
	
	private function set_inlineScrolls(value:Bool):Bool {
		_inlineScrolls = value ? 1 : 0;
		apply();
		return value;
	}

	private function apply():Void {
		if (_target != null && _autoApply == true) {
			if (Std.is(_target, StyleableDisplayObject)) {
				cast(_target, StyleableDisplayObject).applyStyle();
			}
		}
	}

	public function merge(with :Style):Void {
		if (with._width != -1) this._width = with._width;
		if (with._height != -1) this._height = with._height;
		if (with._percentWidth != -1) this._percentWidth = with._percentWidth;
		if (with._percentHeight != -1) this._percentHeight = with._percentHeight;
		if (with._backgroundImage != null) {
			this._backgroundImage = with._backgroundImage;
			this._backgroundImageScale9 = null;
			this._backgroundImageRect = null;
		}
		if (with._backgroundImageScale9 != null) this._backgroundImageScale9 = with._backgroundImageScale9;
		if (with._backgroundImageRect != null) this._backgroundImageRect = with._backgroundImageRect;
		if (with._backgroundColor != -1) {
			this._backgroundColor = with._backgroundColor;
			this._backgroundColorGradientEnd = -1;
		}
		if (with._backgroundColorGradientEnd != -1) this._backgroundColorGradientEnd = with._backgroundColorGradientEnd;
		if (with._borderColor != -1) this._borderColor = with._borderColor;
		if (with._borderSize != -1) this._borderSize = with._borderSize;
		if (with._color != -1) this._color = with._color;
		if (with._paddingLeft != -1) this._paddingLeft = with._paddingLeft;
		if (with._paddingRight != -1) this._paddingRight = with._paddingRight;
		if (with._paddingTop != -1) this._paddingTop = with._paddingTop;
		if (with._paddingBottom != -1) this._paddingBottom = with._paddingBottom;
		if (with._spacingX != -1) this._spacingX = with._spacingX;
		if (with._spacingY != -1) this._spacingY = with._spacingY;
		if (with._cornerRadiusTopLeft != -1) this._cornerRadiusTopLeft = with._cornerRadiusTopLeft;
		if (with._cornerRadiusTopRight != -1) this._cornerRadiusTopRight = with._cornerRadiusTopRight;
		if (with._cornerRadiusBottomLeft != -1) this._cornerRadiusBottomLeft = with._cornerRadiusBottomLeft;
		if (with._cornerRadiusBottomRight != -1) this._cornerRadiusBottomRight = with._cornerRadiusBottomRight;
		if (with._filterSet == true) this._filter = with._filter;
		if (with._alpha != -1) this._alpha = with._alpha;
		if (with._fontName != null) this._fontName = with._fontName;
		if (with._fontSize != -1) this._fontSize = with._fontSize;
		if (with._iconPosition != null) this._iconPosition = with._iconPosition;
		if (with._labelPosition != null) this._labelPosition = with._labelPosition;
		if (with._icon != null) this._icon = with._icon;
		if (with._hasButtons != -1) this._hasButtons = with._hasButtons;
		if (with._gradientType != null) this._gradientType = with._gradientType;
		if (with._selectionMethod != null) this._selectionMethod = with._selectionMethod;
		if (with._autoHideScrolls != -1) this._autoHideScrolls = with._autoHideScrolls;
		if (with._inlineScrolls != -1) this._inlineScrolls = with._inlineScrolls;
	}
}