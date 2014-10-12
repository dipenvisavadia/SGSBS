package components {
	
	import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.HTTPStatusEvent;
    import flash.events.IEventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	/**
	 * ...
	 * @author Dipen Visavadia
	 */
	public class URLChecker extends EventDispatcher {
		
		private var _url:String;
        private var _request:URLRequest;
        private var _loader:URLLoader;
        private var _isLive:Boolean;
        private var _liveStatuses:Array;
        private var _completeEvent:Event;
        private var _dispatched:Boolean;
        private var _log:String = '';
		
		public function URLChecker(target:IEventDispatcher = null) {
			super(target);
            init();
		}
		
		private function init():void {
            _loader = new URLLoader();
            _loader.addEventListener(Event.COMPLETE, _completeHandler);
            _loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, _httpStatusHandler);
            _loader.addEventListener(IOErrorEvent.IO_ERROR, _ioErrorEventHandler);
            _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _securityErrorHandler);
			
            _completeEvent = new Event(Event.COMPLETE, false, true);
			
            _liveStatuses = [];//add other acceptable http statuses here
        }
		
		public function check(url:String = 'http://stackoverflow.com'):void {
            _dispatched = false;
            _url = url;
            _request = new URLRequest(url);
			_request.method = URLRequestMethod.HEAD; // bandwidth :)
            _loader.load(_request);
            _log += 'load for ' + _url + ' started : ' + new Date() + '\n';
        }
		
		private function _completeHandler(e:Event):void {
            _log += e.toString() + ' at ' + new Date();
            _isLive = true;
            if (!_dispatched) {
                dispatchEvent(_completeEvent);
                _dispatched = true;
            }
        }
		
        private function _httpStatusHandler(e:HTTPStatusEvent):void {
            /* comment this in when you're sure what statuses you're after
            var statusesLen:int = _liveStatuses.length;
            for (var i:int = statusesLen; i > 0; i--) {
                if (e.status == _liveStatuses[i]) {
                    _isLive = true;
                    dispatchEvent(_completeEvent);
                }
            }
            */
            //200 range
            _log += e.toString() + ' at ' + new Date();
            if (e.status >= 200 && e.status < 300) _isLive = true;
            else                                   _isLive = false;
            if (!_dispatched) {
                dispatchEvent(_completeEvent);
                _dispatched = true;
            }
        }
		
        private function _ioErrorEventHandler(e:IOErrorEvent):void {
            _log += e.toString() + ' at ' + new Date();
            _isLive = false;
            if (!_dispatched) {
                dispatchEvent(_completeEvent);
                _dispatched = true;
            }
        }
		
        private function _securityErrorHandler(e:SecurityErrorEvent):void {
            _log += e.toString() + ' at ' + new Date();
            _isLive = false;
            if (!_dispatched) {
                dispatchEvent(_completeEvent);
                _dispatched = true;
            }
        }
		
		public function get isLive():Boolean {
			return _isLive;
		}
		
        public function get log():String {
			return _log;
		}
	}

}
/*
USE:
var urlChecker:URLChecker = new URLChecker();
urlChecker.addEventListener(Event.COMPLETE, urlChecked);
urlChecker.check('wrong_place.url');

function urlChecked(event:Event):void {
    trace('is Live: ' + event.target.isLive);
    trace('log: ' + event.target.log);
}
*/

/*
The idea is simple: 1. You create a checked 2. Listen for the COMPLETE event(triggered when it has a result 3. In the handler check if it's live and what it logged.
In the HTTP specs, 200 area seems ok, but depending on what you load, you might need to adjust the class. Also you need to handle security / cross domain issue better, but at least it's a start.
*/