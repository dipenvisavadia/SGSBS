package events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class CustomersListEvent extends Event
	{
		public static const CUSTOMERS_LIST_EVENT:String="customersListEvent";
		public var customersList:ArrayCollection; 

		public function CustomersListEvent(type:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			customersList = new ArrayCollection();
			customersList = data as ArrayCollection;
		}

	}
}

