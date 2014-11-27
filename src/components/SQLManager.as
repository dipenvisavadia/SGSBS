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

	public class SQLManager extends EventDispatcher {
		
		private var conn:SQLConnection;
		private var folder:File;
		private var dbFile:File;
		private var loginStatement:SQLStatement;
		
		private var urlChecker:URLChecker;
		private var isLive:Boolean;
		
		private var pwdInput:String;
		private var userRole:String;
		
		public function SQLManager():void {
			urlChecker = new URLChecker();
			urlChecker.addEventListener(Event.COMPLETE, urlChecked);
			urlChecker.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			urlChecker.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			urlChecker.check('http://www.shreegurjarsutar.com');
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
		
		public function checkPassword(uNameInput:String, pwdInput:String):void {
			this.pwdInput = pwdInput;
			loginStatement = new flash.data.SQLStatement();
			loginStatement.text = 'SELECT * FROM USER_MS WHERE USER_NAME = "' + uNameInput + '";';
			loginStatement.sqlConnection = conn;
			loginStatement.addEventListener(SQLEvent.RESULT, loginResultHandler);
			loginStatement.addEventListener(SQLErrorEvent.ERROR, loginErrorHandler);
			loginStatement.execute();
		}
		
		private function loginResultHandler(SQLE:SQLEvent):void {
			var loginSuccess:Boolean = false;
			var result:SQLResult = loginStatement.getResult();
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
			
		}
		
	}

}