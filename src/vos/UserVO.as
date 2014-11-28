package vos{
	
	public class UserVO {
		
		private var _user_id:uint;
		private var _first_name:String;
		private var _last_name:String;
		private var _user_name:String;
		private var _password:String;
		private var _recovery_email:String;
		private var _role:String;
		private var _active:uint;
		private var _lastmodified_by:String;
		private var _lastmodified_date:String;
		
		public function UserVO {
			
		}
		
		public function get user_id():uint {
			return _user_id;
		}
		
		public function set user_id(value:uint):void {
			_user_id = value;
		}
		
		public function get first_name():String {
			return _first_name;
		}
		
		public function set first_name(value:String):void {
			_first_name = value;
		}
		
		public function get last_name():String {
			return _last_name;
		}
		
		public function set last_name(value:String):void {
			_last_name = value;
		}
		
		public function get user_name():String {
			return _user_name;
		}
		
		public function set user_name(value:String):void {
			_user_name = value;
		}
		
		public function get password():String {
			return _password;
		}
		
		public function set password(value:String):void {
			_password = value;
		}
		
		public function get recovery_email():String {
			return _recovery_email;
		}
		
		public function set recovery_email(value:String):void {
			_recovery_email = value;
		}
		
		public function get role():String {
			return _role;
		}
		
		public function set role(value:String):void {
			_role = value;
		}
		
		public function get active():uint {
			return _active;
		}
		
		public function set active(value:uint):void {
			_active = value;
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