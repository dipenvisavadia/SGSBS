package {
	
	public class OrderPackageMappingVO {
		
		private var _opm_id:uint;
		private var _opm_order_id:uint;
		private var _opm_pkg_id:uint;
		private var _opm_from_date:String;
		private var _opm_to_date:String;
		private var _opm_qty:Number;
		private var _opm_rate:Number;
		private var _opm_amount:Number;
		private var _opm_lastmodified_by:String;
		private var _opm_lastmodified_date:String;
		
		public function OrderPackageMappingVO {
			
		}
		
		public function get opm_id():uint {
			return _opm_id;
		}
		
		public function set opm_id(value:uint):void {
			_opm_id = value;
		}
		
		public function get opm_order_id():uint {
			return _opm_order_id;
		}
		
		public function set opm_order_id(value:uint):void {
			_opm_order_id = value;
		}
		
		public function get opm_pkg_id():uint {
			return _opm_pkg_id;
		}
		
		public function set opm_pkg_id(value:uint):void {
			_opm_pkg_id = value;
		}
		
		public function get opm_from_date():String {
			return _opm_from_date;
		}
		
		public function set opm_from_date(value:String):void {
			_opm_from_date = value;
		}
		
		public function get opm_to_date():String {
			return _opm_to_date;
		}
		
		public function set opm_to_date(value:String):void {
			_opm_to_date = value;
		}
		
		public function get opm_qty():Number {
			return _opm_qty;
		}
		
		public function set opm_qty(value:Number):void {
			_opm_qty = value;
		}
		
		public function get opm_rate():Number {
			return _opm_rate;
		}
		
		public function set opm_rate(value:Number):void {
			_opm_rate = value;
		}
		
		public function get opm_amount():Number {
			return _opm_amount;
		}
		
		public function set opm_amount(value:Number):void {
			_opm_amount = value;
		}
		
		public function get opm_lastmodified_by():String {
			return _opm_lastmodified_by;
		}
		
		public function set opm_lastmodified_by(value:String):void {
			_opm_lastmodified_by = value;
		}
		
		public function get opm_lastmodified_date():String {
			return _opm_lastmodified_date;
		}
		
		public function set opm_lastmodified_date(value:String):void {
			_opm_lastmodified_date = value;
		}
		
	}
	
}