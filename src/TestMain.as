package
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;

	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;

	import tests.SampleTests;

	public class TestMain extends Sprite
	{
		private var _flexunit:FlexUnitCore;

		public function TestMain()
		{
			this._flexunit = new FlexUnitCore();
			this._flexunit.addListener(new TraceListener());
			this._flexunit.addListener(new ExitCodeListener());
			this._flexunit.run(
			[
				SampleTests
			]);
		}
	}
}

import flash.desktop.NativeApplication;

import org.flexunit.runner.Result;
import org.flexunit.runner.notification.RunListener;

/**
 * Exits the AIR application with an appropriate exit code based on the result
 * of the test run. Exits with code 1 on failure and code 0 on success.
 */
class ExitCodeListener extends RunListener
{
	override public function testRunFinished(result:Result):void
	{
		var exitCode:int = result.failureCount > 0 ? 1: 0;
		NativeApplication.nativeApplication.exit(exitCode);
	}
}