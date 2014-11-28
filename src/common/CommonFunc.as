package common
{
	import flash.events.SQLErrorEvent;
	
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.utils.StringUtil;
	
	import spark.formatters.DateTimeFormatter;
	import spark.formatters.NumberFormatter;

	public class CommonFunc
	{
		private static var amtNumFormatter:NumberFormatter=new NumberFormatter();
		private static var dateFormatter:DateTimeFormatter=new DateTimeFormatter();

		public function CommonFunc()
		{
			//amtNumFormatter.precision = 2;
			//dateFormatter.formatString = AppConst.DATE_TIME_FORMAT;
		}

		public static function search(whatToSearch:*, whereToSearch:*, propToSearch:String, caseSensitive:Boolean=true):int
		{
			var index:int=-1;

			if (whatToSearch == null || whereToSearch == null)
				return index;

			if (whatToSearch is String && String(whatToSearch).length == 0)
				return index;

			//CHECK CASE SENSITIVE SEARCH FOR STRING VALUE
			var searchingFor:*=whatToSearch;

			if (propToSearch == null || propToSearch.length == 0)
			{
				//search into whereToSearch without property
				for (var i:int=0; i < whereToSearch.length; i++)
				{
					//string search
					if(isNaN(whatToSearch))
					{
						if (whatToSearch is String && !caseSensitive)
						{
							//convert into upper case and then match
							if (whereToSearch[i].toString().toUpperCase() == searchingFor.toString().toUpperCase())
							{
								index=i;
								break;
							}
						}
						else
						{
							if (whereToSearch[i] == searchingFor)
							{
								index=i;
								break;
							}
						}	
					}else
					{
						//numeric search
						//parse numeric value and then match
						if(parseFloat(whereToSearch[i]) == parseFloat(searchingFor))
						{
							index=i;
							break;
						}
					}
				}
			}
			else
			{
				//search into whereToSearch with property
				for (var j:int=0; j < whereToSearch.length; j++)
				{
					//string search
					if(isNaN(whatToSearch))
					{
						if (whatToSearch is String && !caseSensitive)
						{
							if (String(whereToSearch[j][propToSearch]).toUpperCase() == searchingFor.toString().toUpperCase())
							{
								index=j;
								break;
							}
						}
						else
						{
							if (whereToSearch[j][propToSearch] == searchingFor)
							{
								index=j;
								break;
							}
						}
					}else
					{
						//numeric search
						//parse numeric value and then match
						if(parseFloat(whereToSearch[j][propToSearch]) == parseFloat(searchingFor))
						{
							index=j;
							break;
						}
					}
				}
			}

			return index;

		}
		
		
		/**
		 * 2012-12-25 03:16:37
		 * as per AppConst.DATE_TIME_FORMAT
		 * */
		public static function castToDate(value:*):Date
		{
			if (value == null)
			{
				return null;
			}
			var dateInStrFormat:String=value;
			dateInStrFormat=StringUtil.trim(dateInStrFormat);
			var tempDateArr:Array=dateInStrFormat.split(" ");
			var simpleDate:Date=DateField.stringToDate(tempDateArr[0], AppConst.DATE_FORMAT);
			trace("org date["+dateInStrFormat+"]");
			trace("simpleDate["+simpleDate+"]");
			//trace(""+tempDateArr[1].toString().substr(0,2))
			//trace(""+tempDateArr[1].toString().substr(3,2))
			//trace(""+tempDateArr[1].toString().substr(6,2))*/
			simpleDate=new Date(simpleDate.fullYear, simpleDate.month, simpleDate.date, tempDateArr[1].toString().substr(0, 2), tempDateArr[1].toString().substr(3, 2), tempDateArr[1].toString().substr(6, 2));
			////trace("formatted Date["+simpleDate+"]");
			return simpleDate;

		}

		public static function castToDateString(value:Date):String
		{
			if (value == null || !value is Date)
			{
				return "";
			}

			dateFormatter.dateTimePattern=AppConst.DATE_TIME_FORMAT;

			var tempStr:String=dateFormatter.format(value);
			trace("orgDate["+value+"],formatted date["+tempStr+"]");
			return tempStr;
		}

		public static function castToDBDateString(value:Date):String
		{
			if (value == null || !value is Date)
			{
				return "";
			}

			dateFormatter.dateTimePattern=AppConst.dbDateFormat;

			var tempStr:String=dateFormatter.format(value);
			////trace("orgDate["+value+"],formatted date["+tempStr+"]");
			return tempStr;
		}

		public static var localDate:Date=new Date();

		/**
		 * func accepts local timezone related date, calculate UTC date
		 * reutrn it into db date string format
		 * */
		public static function castToUTCDateDBString(value:*):String
		{
			if (value == null || value.length == 0)
			{
				return null;
			}

			var dateValue:Date=CommonFunc.castToDate(value);
			if (dateValue != null)
			{
				var utcDate:Date=new Date(dateValue.valueOf() + localDate.timezoneOffset * 60000);
				//trace("value["+value+"],timezoneOffset["+localDate.timezoneOffset+"],utcDate["+utcDate+"]");
				var temp:String = CommonFunc.castToDBDateString(utcDate);
				//trace("casted date["+temp+"]");
				return temp;
			}
			else
			{
				return "";
			}
		}

		/**
		 * func accepts UTC-0 date, convert it into local date format
		 * reutrn it into db date string format
		 * */
		public static function castToLocalTimezoneDateString(value:*):String
		{
			if (value == null || value.length == 0)
			{
				return null;
			}

			var dateValue:Date=CommonFunc.castToDate(value);
			if (dateValue != null)
			{
				var localCalDate:Date=new Date(dateValue.valueOf() - localDate.timezoneOffset * 60000);
				return CommonFunc.castToDBDateString(localCalDate);
			}
			else
			{
				return "";
			}
		}
		
		public static function todayDate():Date
		{
			return new Date(new Date().fullYear,new Date().month,new Date().date,0,0,0,0);
		}

		public static function yesterdayDate():Date
		{
			return new Date(new Date().fullYear,new Date().month,new Date().date-1,0,0,0,0);
		}
		
		public static function getPreviousDateByOffset(offset:int):Date
		{
			//trace("offset["+offset+"]");
			var prevDateByOffset:Date = new Date(new Date().fullYear,new Date().month,new Date().date-offset,0,0,0,0); 
			Alert.show("offset["+offset+"],prevDateByOffset["+prevDateByOffset+"]");
			return prevDateByOffset;
		}

		public static function getDateByOffset(targetDate:Date,offset:int):Date
		{
			//trace("offset["+offset+"]");
			var prevDateByOffset:Date = new Date(targetDate.fullYear,targetDate.month,targetDate.date-offset,0,0,0,0); 
			Alert.show("offset["+offset+"],DateByOffset["+prevDateByOffset+"]");
			return prevDateByOffset;
		}
		
		// Rounds a target number to a specific number of decimal places.
		public static function roundToPrecision(numberVal:Number, precision:int=2):Number
		{
			var decimalPlaces:Number=Math.pow(10, precision);
			var value:Number=Math.round(decimalPlaces * numberVal) / decimalPlaces;
			return value;
		}

		public static function perceLabelFunc(value:Number):String
		{
			return '' + roundToPrecision(value) + '%';
		}

		/*public static function currencyLabelFunc(value:Number,currency:String="USD"):String
		{
			amtNumFormatter.precision=2;

			return ResourceUtil.string(currency.toUpperCase())+''+amtNumFormatter.format(roundToPrecision(value));
		}*/
	
		public static function formatToAmt(value:Number):String
		{
			//amtNumFormatter.precision=2;
			return amtNumFormatter.format(roundToPrecision(value));
		}

		private static var logText:String="";

		/*public static function logHandler(event:LogEvent):void
		{
			////trace(''+event.message);
			appendRawMessage(event.message);
			MagentoDataModel.postLog(logText);
			logText="";
		}*/

		private static function appendRawMessage(value:Object):void
		{
			var msg:String=value.toString();
			if (msg.indexOf("ERROR") > -1)
			{
				appendLog(msg, "red");
			}
			else if (msg.indexOf("WARNING") > -1)
			{
				appendLog(msg, "yellow");
			}
			else if (msg.indexOf("SQLERROR") > -1)
			{
				appendLog(msg, "blue");
			}
			else
			{
				appendLog(msg, "green");
			}
		}

		private static function appendLog(value:String, color:String="#fff"):void
		{
			var d:Date=new Date();
			var df:DateTimeFormatter=new DateTimeFormatter();
			df.dateTimePattern="HH:NN:SS A";
			//uncomment to show log with html formatting
			//logText = logText+'<div style="font-size:11px;font-family:tahoma;color:#fff;background-color:#000;">[<span style="width:100px">'+df.format(d) +'</span>] : <span style="color:'+color+'">'+value+'</span></div>';
			logText=logText + '[' + df.format(d) + ']:' + value;
		}
		
		public static function onSQLError(event:SQLErrorEvent):void
		{
			Alert.show('There are some error.Error:'+event.error.message);
		}
		
		public static function alertUserOnNoInternetConnection():void
		{
			//Alert.show(ResourceUtil.string('APP_INTERNET_NOT_AVAIL'));
		}

	}
}

