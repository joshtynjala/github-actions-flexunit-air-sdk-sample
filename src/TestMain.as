package
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.events.Event;

	import org.flexunit.internals.TraceListener;
	import org.flexunit.listeners.CIListener;
	import org.flexunit.runner.FlexUnitCore;

	import tests.SampleTests;

	public class TestMain extends Sprite
	{
		private var _flexunit:FlexUnitCore;

		public function TestMain()
		{
			this._flexunit = new FlexUnitCore();
			this._flexunit.addListener(new TraceListener());
			this._flexunit.addListener(new CIListener());
			this._flexunit.addEventListener(FlexUnitCore.TESTS_COMPLETE, flexunit_testsCompleteHandler);
			this._flexunit.run(
			[
				SampleTests
			]);
		}


		private function flexunit_testsCompleteHandler(event:Event):void
		{
			NativeApplication.nativeApplication.exit();
		}
	}
}