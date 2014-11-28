package vos {
	
	public class OrderVO {
		
		private var _o_id:uint;
		private var _o_receipt_no:uint;
		private var _o_cust_id:uint;
		private var _o_booking_date:String;
		private var _o_total_bill_amt:Number;
		private var _o_extra_charge:Number;
		private var _o_discount:Number;
		private var _o_ex_discount:Number;
		private var _o_paid_deposit:Number;
		private var _o_total_paid_amt:Number;
		private var _o_status:String;
		private var _o_desc:String;
		private var _o_extra_charge_desc:String;
		private var _o_lastmodified_by:String;
		private var _o_lastmodified_date:String;
		
		public function OrderVO {
			
		}
		
		public function get o_id():uint {
			return _o_id;
		}
		
		public function set o_id(value:uint):void {
			_o_id = value;
		}
		
		public function get o_receipt_no():uint {
			return _o_receipt_no;
		}
		
		public function set o_receipt_no(value:uint):void {
			_o_receipt_no = value;
		}
		
		public function get o_cust_id():uint {
			return _o_cust_id;
		}
		
		public function set o_cust_id(value:uint):void {
			_o_cust_id = value;
		}
		
		public function get o_booking_date():String {
			return _o_booking_date;
		}
		
		public function set o_booking_date(value:String):void {
			_o_booking_date = value;
		}
		
		public function get o_total_bill_amt():Number {
			return _o_total_bill_amt;
		}
		
		public function set o_total_bill_amt(value:Number):void {
			_o_total_bill_amt = value;
		}
		
		public function get o_extra_charge():Number {
			return _o_extra_charge;
		}
		
		public function set o_extra_charge(value:Number):void {
			_o_extra_charge = value;
		}
		
		public function get o_discount():Number {
			return _o_discount;
		}
		
		public function set o_discount(value:Number):void {
			_o_discount = value;
		}
		
		public function get o_ex_discount():Number {
			return _o_ex_discount;
		}
		
		public function set o_ex_discount(value:Number):void {
			_o_ex_discount = value;
		}
		
		public function get o_paid_deposit():Number {
			return _o_paid_deposit;
		}
		
		public function set o_paid_deposit(value:Number):void {
			_o_paid_deposit = value;
		}
		
		public function get o_total_paid_amt():Number {
			return _o_total_paid_amt;
		}
		
		public function set o_total_paid_amt(value:Number):void {
			_o_total_paid_amt = value;
		}
		
		public function get o_status():String {
			return _o_status;
		}
		
		public function set o_status(value:String):void {
			_o_status = value;
		}
		
		public function get o_desc():String {
			return _o_desc;
		}
		
		public function set o_desc(value:String):void {
			_o_desc = value;
		}
		
		public function get o_extra_charge_desc():String {
			return _o_extra_charge_desc;
		}
		
		public function set o_extra_charge_desc(value:String):void {
			_o_extra_charge_desc = value;
		}
		
		public function get o_lastmodified_by():String {
			return _o_lastmodified_by;
		}
		
		public function set o_lastmodified_by(value:String):void {
			_o_lastmodified_by = value;
		}
		
		public function get o_lastmodified_date():String {
			return _o_lastmodified_date;
		}
		
		public function set o_lastmodified_date(value:String):void {
			_o_lastmodified_date = value;
		}
		
	}
	
}