package vos {
	import common.CommonFunc;
	
	public class CustomerVO {
		
		private var _customer_id:uint;
		private var _first_name:String;
		private var _middle_name:String;
		private var _last_name:String;
		private var _comm_member:uint;
		private var _pan:String;
		private var _contactnum1:uint;
		private var _contactnum2:uint;
		private var _address:String;
		private var _city:String;
		private var _email:String;
		private var _desc:String;
		private var _lastmodified_by:String;
		private var _lastmodified_date:String;
		
		public function CustomerVO()
		{
			_comm_member = 0;
			_lastmodified_by = "Mukesh";//use logged in username 
			_lastmodified_date = CommonFunc.castToDateString(new Date());//format date into dd/mm/yyyy HH:MM:SS format
		}
		
		public function get customer_id():uint {
			return _customer_id;
		}
		
		public function set customer_id(value:uint):void {
			_customer_id = value;
		}
		
		public function get first_name():String {
			return _first_name;
		}
		
		public function set first_name(value:String):void {
			_first_name = value;
		}
		
		public function get middle_name():String {
			return _middle_name;
		}
		
		public function set middle_name(value:String):void {
			_middle_name = value;
		}
		
		public function get last_name():String {
			return _last_name;
		}
		
		public function set last_name(value:String):void {
			_last_name = value;
		}
		
		public function get comm_member():uint {
			return _comm_member;
		}
		
		public function set comm_member(value:uint):void {
			_comm_member = value;
		}
		
		public function get pan():String {
			return _pan;
		}
		
		public function set pan(value:String):void {
			_pan = value;
		}
		
		public function get contactnum1():uint {
			return _contactnum1;
		}
		
		public function set contactnum1(value:uint):void {
			_contactnum1 = value;
		}
		
		public function get contactnum2():uint {
			return _contactnum2;
		}
		
		public function set contactnum2(value:uint):void {
			_contactnum2 = value;
		}
		
		public function get address():String {
			return _address;
		}
		
		public function set address(value:String):void {
			_address = value;
		}
		
		public function get city():String {
			return _city;
		}
		
		public function set city(value:String):void {
			_city = value;
		}
		
		public function get email():String {
			return _email;
		}
		
		public function set email(value:String):void {
			_email = value;
		}
		
		public function get desc():String {
			return _desc;
		}
		
		public function set desc(value:String):void {
			_desc = value;
		}
		
		public function get lastmodified_by():String {
			return _lastmodified_by;
		}
		
		public function set lastmodified_by(value:String):void {
			_lastmodified_by = value;
		}
		
		public function get lastmodified_date():String {
			return _lastmodified_date;
		}
		
		public function set lastmodified_date(value:String):void {
			_lastmodified_date = value;
		}
		
	}
	
}