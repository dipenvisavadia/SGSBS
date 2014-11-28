package components {
	/**
	 * ...
	 * @author Dipen Visavadia
	 */
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ErrorEvent;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import mx.controls.Alert;

	import components.URLChecker;
	import vos.CustomerVO;
	import vos.UserVO;

	public class SQLManager extends EventDispatcher {
		
		private var _instance:SQLManager = null;
		
		private var logsON:Boolean = true;
		
		private var conn:SQLConnection;
		private var folder:File;
		private var dbFile:File;
		
		private var urlChecker:URLChecker;
		private var isLive:Boolean;
		private var sqlStatement:SQLStatement;
		
		//LOGIN
		private var pwdInput:String;
		private var userRole:String;
		
		public function SQLManager(SE:SingletonEnforcer):void {
			urlChecker = new URLChecker();
			urlChecker.addEventListener(Event.COMPLETE, urlChecked);
			urlChecker.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			urlChecker.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			urlChecker.check('http://www.shreegurjarsutar.com');
		}
		
		public static function getInstance():SQLManager {
            if(_instance == null){
                _instance = new SQLManager(new components.SingletonEnforcer());
            }
            return _instance;
        }
		
		private function urlChecked(E:Event):void {
			Alert.show('is Live: ' + E.target.isLive);
			//Alert.show('log: ' + E.target.log);
			
			isLive = E.target.isLive;
			
			conn = new flash.data.SQLConnection();
			conn.addEventListener(SQLEvent.OPEN, openHandler);
			conn.addEventListener(SQLErrorEvent.ERROR, errorHandler);
			folder = File.applicationDirectory;
			dbFile = folder.resolvePath("SGSBS.db");
			conn.openAsync(dbFile);
		}
		
		private function ioErrorHandler(IOEE:IOErrorEvent):void {
			Alert.show('IO Error: ' + IOEE);
		}
		
		private function securityErrorHandler(SEE:SecurityErrorEvent):void {
			Alert.show('Security Error: ' + SEE);
		}
		
		private function openHandler(SQLE:SQLEvent):void {
			Alert.show('The databse connected successfully');
			if (isLive) {
				//UPLOAD DATABASE
			}
			this.dispatchEvent(new Event(Event.COMPLETE, false, true));
		}
		
		private function errorHandler(SQLERRE:SQLErrorEvent):void {
			Alert.show('Error Message:', SQLERRE.error.message);
			Alert.show('Details:', SQLERRE.error.details);
			if (isLive) {
				//DOWNLOAD DATABASE TEMPLATE FROM WEBSITE & THEN TRY TO CONNECT AGAIN USING FOLLOWING CODE
				/*
				dbFile = folder.resolvePath("database/SGSBS.db");
				conn.openAsync(dbFile);
				*/
			} else {
				Alert.show('Database not found, please connect Internet and restart application');
				this.dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, true, true, 'Database Not Found'));
			}
		}
		//LOGIN
		public function checkPassword(uNameInput:String, pwdInput:String):void {
			this.pwdInput = pwdInput;
			sqlStatement = new flash.data.SQLStatement();
			sqlStatement.text = 'select * from user_ms where user_name = "' + uNameInput + '";';
			if (logsON) {
				trace(sqlStatement.text);
			}
			sqlStatement.sqlConnection = conn;
			sqlStatement.addEventListener(SQLEvent.RESULT, loginResultHandler);
			sqlStatement.addEventListener(SQLErrorEvent.ERROR, loginErrorHandler);
			sqlStatement.execute();
		}
		
		private function loginResultHandler(SQLE:SQLEvent):void {
			sqlStatement.removeEventListener(SQLEvent.RESULT, loginResultHandler);
			var loginSuccess:Boolean = false;
			var result:SQLResult = sqlStatement.getResult();
			if (result.data) {
				var numResults:int = result.data.length;
				if (numResults == 1) {
					var row:Object = result.data[0];
					if (this.pwdInput == row.PASSWORD) {
						userRole = row.USER_ROLE;
						loginSuccess = true;
					} else {
						loginSuccess = false;
					}
				} else {
					loginSuccess = false;
				}
			} else {
				loginSuccess = false;
			}
			if (loginSuccess) {
				Alert.show('Login Successful', 'Success');
				this.dispatchEvent(new Event('LOGIN_SUCCESS', false, true));
			} else {
				Alert.show('Wrong user name or password', 'Error');
			}
		}
		
		private function loginErrorHandler(SQLEE:SQLErrorEvent):void {
			sqlStatement.removeEventListener(SQLErrorEvent.ERROR, loginErrorHandler);
		}
		//GET ALL CUSTOMERS
		public function getAllCustomers(isMember:Boolean):void {
			sqlStatement = new flash.data.SQLStatement();
			sqlStatement.text = 'SELECT * FROM customer_ms WHERE comm_member = "' + ((isMember)?1:0) + '";';
			if (logsON) {
				trace(sqlStatement.text);
			}
			sqlStatement.sqlConnection = conn;
			sqlStatement.addEventListener(SQLEvent.RESULT, getCustomerResultHandler);
			sqlStatement.addEventListener(SQLErrorEvent.ERROR, getCustomerErrorHandler);
			sqlStatement.execute();
		}
		
		private function getCustomerResultHandler(SQLE:SQLEvent):void {
			sqlStatement.removeEventListener(SQLEvent.RESULT, getCustomerResultHandler);
			//Update customer VO here
		}
		
		private function getCustomerErrorHandler(SQLEE:SQLErrorEvent):void {
			sqlStatement.removeEventListener(SQLErrorEvent.ERROR, getCustomerErrorHandler);
		}
		//ADD CUSTOMER
		public function addCustomer(custObj:CustomerVO):void {
			sqlStatement = new flash.data.SQLStatement();
			sqlStatement.text = "INSERT INTO customer_ms (first_name, middle_name, last_name, comm_member, pan, contactnum1, contactnum2, address, city, email, desc, lastmodified_by, lastmodified_date)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			sqlStatement.parameters[0] = custObj.first_name;
			sqlStatement.parameters[1] = custObj.middle_name;
			sqlStatement.parameters[2] = custObj.last_name;
			sqlStatement.parameters[3] = custObj.comm_member;
			sqlStatement.parameters[4] = custObj.pan;
			sqlStatement.parameters[5] = custObj.contactnum1;
			sqlStatement.parameters[6] = custObj.contactnum2;
			sqlStatement.parameters[7] = custObj.address;
			sqlStatement.parameters[8] = custObj.city;
			sqlStatement.parameters[9] = custObj.email;
			sqlStatement.parameters[10] = custObj.desc;
			sqlStatement.parameters[11] = custObj.lastmodified_by;
			sqlStatement.parameters[12] = custObj.lastmodified_date;
			
			sqlStatement.sqlConnection = conn;
			sqlStatement.addEventListener(SQLEvent.RESULT, addCustomerResultHandler);
			sqlStatement.addEventListener(SQLErrorEvent.ERROR, addCustomerErrorHandler);
			sqlStatement.execute();
		}
		
		private function addCustomerResultHandler(SQLE:SQLEvent):void {
			sqlStatement.removeEventListener(SQLEvent.RESULT, addCustomerResultHandler);
			//Check the new customer id generated
		}
		
		private function addCustomerErrorHandler(SQLEE:SQLErrorEvent):void {
			sqlStatement.removeEventListener(SQLErrorEvent.ERROR, addCustomerErrorHandler);
		}
		//UPDATE CUSTOMER
		public function updateCustomer(custObj:CustomerVO):void {
			sqlStatement = new flash.data.SQLStatement();
			sqlStatement.text = "UPDATE customer_ms SET (first_name, middle_name, last_name, comm_member, pan, contactnum1, contactnum2, address, city, email, desc, lastmodified_by, lastmodified_date)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) WHERE customer_id = " + custObj.customer_id;
			sqlStatement.parameters[0] = custObj.first_name;
			sqlStatement.parameters[1] = custObj.middle_name;
			sqlStatement.parameters[2] = custObj.last_name;
			sqlStatement.parameters[3] = custObj.comm_member;
			sqlStatement.parameters[4] = custObj.pan;
			sqlStatement.parameters[5] = custObj.contactnum1;
			sqlStatement.parameters[6] = custObj.contactnum2;
			sqlStatement.parameters[7] = custObj.address;
			sqlStatement.parameters[8] = custObj.city;
			sqlStatement.parameters[9] = custObj.email;
			sqlStatement.parameters[10] = custObj.desc;
			sqlStatement.parameters[11] = custObj.lastmodified_by;
			sqlStatement.parameters[12] = custObj.lastmodified_date;
			
			sqlStatement.sqlConnection = conn;
			sqlStatement.addEventListener(SQLEvent.RESULT, updateCustomerResultHandler);
			sqlStatement.addEventListener(SQLErrorEvent.ERROR, updateCustomerErrorHandler);
			sqlStatement.execute();
		}
		
		private function updateCustomerResultHandler(SQLE:SQLEvent):void {
			sqlStatement.removeEventListener(SQLEvent.RESULT, updateCustomerResultHandler);
			//Check the new customer id generated
		}
		
		private function updateCustomerErrorHandler(SQLEE:SQLErrorEvent):void {
			sqlStatement.removeEventListener(SQLErrorEvent.ERROR, updateCustomerErrorHandler);
		}
		
	}
	
}

//I’m outside the package so I can only be access internally
class SingletonEnforcer {
	//nothing else required here
}