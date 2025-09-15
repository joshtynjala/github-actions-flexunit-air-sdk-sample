package {
    import org.flexunit.internals.TraceListener;
    import org.flexunit.runner.IDescription;

    public class PrettyTraceListener extends TraceListener {
        public function PrettyTraceListener() {
            super();
        }

        override public function testStarted( description:IDescription ):void {
            //super.testStarted(description); // Uncommenting this makes the trace come back in the terminal console
            trace(description.displayName + " . <- Same as original, with this extra text");
        }
    }
}