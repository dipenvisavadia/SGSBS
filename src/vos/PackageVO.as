package vos {
	
	public class PackageVO {
		
		private var _pm_id:uint;
		private var _pm_name:String;
		private var _pm_desc:String;
		private var _pm_cust_type:String;
		private var _pm_for_gender:String;
		private var _pm_from:Number;
		private var _pm_to:Number;
		private var _pm_rate:Number;
		private var _pm_isAC:uint;
		private var _pm_active:uint;
		private var _pm_lastmodified_by:String;
		private var _pm_lastmodified_date:String;
		
		public function PackageVO {
			
		}
		
		public function get pm_id():uint {
			return _pm_id;
		}
		
		public function set pm_id(value:uint):void {
			_pm_id = value;
		}
		
		public function get pm_name():String {
			return _pm_name;
		}
		
		public function set pm_name(value:String):void {
			_pm_name = value;
		}
		
		public function get pm_desc():String {
			return _pm_desc;
		}
		
		public function set pm_desc(value:String):void {
			_pm_desc = value;
		}
		
		public function get pm_cust_type():String {
			return _pm_cust_type;
		}
		
		public function set pm_cust_type(value:String):void {
			_pm_cust_type = value;
		}
		
		public function get pm_for_gender():String {
			return _pm_for_gender;
		}
		
		public function set pm_for_gender(value:String):void {
			_pm_for_gender = value;
		}
		
		public function get pm_from():Number {
			return _pm_from;
		}
		
		public function set pm_from(value:Number):void {
			_pm_from = value;
		}
		
		public function get pm_to():Number {
			return _pm_to;
		}
		
		public function set pm_to(value:Number):void {
			_pm_to = value;
		}
		
		public function get pm_rate():Number {
			return _pm_rate;
		}
		
		public function set pm_rate(value:Number):void {
			_pm_rate = value;
		}
		
		public function get pm_isAC():uint {
			return _pm_isAC;
		}
		
		public function set pm_isAC(value:uint):void {
			_pm_isAC = value;
		}
		
		public function get pm_active():uint {
			return _pm_active;
		}
		
		public function set pm_active(value:uint):void {
			_pm_active = value;
		}
		
		public function get pm_lastmodified_by():String {
			return _pm_lastmodified_by;
		}
		
		public function set pm_lastmodified_by(value:String):void {
			_pm_lastmodified_by = value;
		}
		
		public function get pm_lastmodified_date():String {
			return _pm_lastmodified_date;
		}
		
		public function set pm_lastmodified_date(value:String):void {
			_pm_lastmodified_date = value;
		}
		
	}
	
}