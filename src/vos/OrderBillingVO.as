package {
	
	public class OrderBillingVO {
		
		private var _ob_id:uint;
		private var _ob_order_receiptno:uint;
		private var _ob_order_id:uint;
		private var _ob_bill_amount:Number;
		private var _ob_bill_deposit_amount:Number;
		private var _ob_bill_paid_amount:Number;
		private var _ob_bill_balance_amount:Number;
		private var _ob_bill_service_tax:Number;
		private var _ob_bill_date:String;
		private var _ob_pay_mode:String;
		private var _ob_pay_chequeno:String;
		private var _op_pay_bankname:String;
		private var _op_pay_branchname:String;
		private var _op_bill_pay_date:String;
		private var _op_payment_status:String;
		private var _op_lastmodified_by:String;
		private var _op_lastmodified_date:String;
		
		public function OrderBillingVO {
			
		}
		
		public function get ob_id():uint {
			return _ob_id;
		}
		
		public function set ob_id(value:uint):void {
			_ob_id = value;
		}
		
		public function get ob_order_receiptno():uint {
			return _ob_order_receiptno;
		}
		
		public function set ob_order_receiptno(value:uint):void {
			_ob_order_receiptno = value;
		}
		
		public function get ob_order_id():uint {
			return _ob_order_id;
		}
		
		public function set ob_order_id(value:uint):void {
			_ob_order_id = value;
		}
		
		public function get ob_bill_amount():Number {
			return _ob_bill_amount;
		}
		
		public function set ob_bill_amount(value:Number):void {
			_ob_bill_amount = value;
		}
		
		public function get ob_bill_deposit_amount():Number {
			return _ob_bill_deposit_amount;
		}
		
		public function set ob_bill_deposit_amount(value:Number):void {
			_ob_bill_deposit_amount = value;
		}
		
		public function get ob_bill_paid_amount():Number {
			return _ob_bill_paid_amount;
		}
		
		public function set ob_bill_paid_amount(value:Number):void {
			_ob_bill_paid_amount = value;
		}
		
		public function get ob_bill_balance_amount():Number {
			return _ob_bill_balance_amount;
		}
		
		public function set ob_bill_balance_amount(value:Number):void {
			_ob_bill_balance_amount = value;
		}
		
		public function get ob_bill_service_tax():Number {
			return _ob_bill_service_tax;
		}
		
		public function set ob_bill_service_tax(value:Number):void {
			_ob_bill_service_tax = value;
		}
		
		public function get ob_bill_date():String {
			return _ob_bill_date;
		}
		
		public function set ob_bill_date(value:String):void {
			_ob_bill_date = value;
		}
		
		public function get ob_pay_mode():String {
			return _ob_pay_mode;
		}
		
		public function set ob_pay_mode(value:String):void {
			_ob_pay_mode = value;
		}
		
		public function get ob_pay_chequeno():String {
			return _ob_pay_chequeno;
		}
		
		public function set ob_pay_chequeno(value:String):void {
			_ob_pay_chequeno = value;
		}
		
		public function get op_pay_bankname():String {
			return _op_pay_bankname;
		}
		
		public function set op_pay_bankname(value:String):void {
			_op_pay_bankname = value;
		}
		
		public function get op_pay_branchname():String {
			return _op_pay_branchname;
		}
		
		public function set op_pay_branchname(value:String):void {
			_op_pay_branchname = value;
		}
		
		public function get op_bill_pay_date():String {
			return _op_bill_pay_date;
		}
		
		public function set op_bill_pay_date(value:String):void {
			_op_bill_pay_date = value;
		}
		
		public function get op_payment_status():String {
			return _op_payment_status;
		}
		
		public function set op_payment_status(value:String):void {
			_op_payment_status = value;
		}
		
		public function get op_lastmodified_by():String {
			return _op_lastmodified_by;
		}
		
		public function set op_lastmodified_by(value:String):void {
			_op_lastmodified_by = value;
		}

	}
	
}