package tests
{
	import flash.display.Sprite;

	import org.flexunit.Assert;
	import org.flexunit.async.Async;

	public class SampleTests {
		private var _sprite:Sprite;

		[Before]
		/**
		 * A method with [Before] metadata is called immediately before every
		 * test method.
		 */
		public function setup():void {
			_sprite = new Sprite();
		}

		[After]
		/**
		 * A method with [After] metadata is called immediately after every
		 * test method.
		 */
		public function teardown():void {
			this._sprite = null;
		}

		[Test]
		/**
		 * All methods with [Test] metadata will be called automatically by the
		 * test runner.
		 */
		public function testSample():void {
			// Each test must include one or more assertions
			Assert.assertNull(_sprite);
		}

		[Test(async,timeout="2000")]
		/**
		 * Adding async to [Test] metadata will make the test asynchronous.
		 * Specifying a timeout is optional. A longer timeout may be useful on
		 * CI servers.
		 */
		public function testSampleAsync():void {
			// async tests may be used for testing actions that need to wait for
			// an event or some kind of delay
			Async.delayCall(this, function():void
			{
				Assert.assertNotNull(_sprite);
			}, 250);
		}
	}
}