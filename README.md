# Github Actions with FlexUnit and the Adobe AIR SDK

Learn to set up [Github Actions](https://github.com/actions/) to run your [FlexUnit tests](https://flex.apache.org/flexunit/tutorial/) using the ASC 2.0 compiler in the [Adobe AIR SDK](https://airsdk.dev).

## Download FlexUnit

FlexUnit is maintained by the Apache Flex project. The latest stable release of FlexUnit is available for download from the following URL:

- https://flex.apache.org/download-flexunit.html

Download **Binaries (tar.gz)** on macOS or Linux, or **Binaries (zip)** on Windows. You can download a Source release of FlexUnit instead, if you prefer, but you will need to compile it yourself.

## Using FlexUnit with the Adobe AIR SDK and Compiler

While FlexUnit includes _Flex_ in its name, it does not strictly require the Flex SDK to use. You may use FlexUnit with the ASC 2.0 compiler that is included with the Adobe AIR SDK, with some very minor tweaks that are easy to do.

First, extract the downloaded archive. We're interested in the _flexunit_ sub-directory, which contains a number compiled SWC libraries. To use FlexUnit with the AIR SDK, we need to remove one of these SWC libraries.

Look for the _.swc_ file with a name similar to _flexunit-x.y.z-YYYYMMDD-**flex**\_a.b.c.swc_. That's the one we need to remove. There is another one with a similar name,  _flexunit-x.y.z-YYYYMMDD-**as3**\_a.b.c.swc_. We'll keep that one.

Once you've removed the file, you can add the _flexunit_ sub-directory to the library path in your project's compiler options. If you were to compile from the command line, you might compile your test project like this:

```sh
amxmlc --source-path+=src --library-path+=apache-flex-flexunit-4.2.0-4.12.0-bin/flexunit --output bin/Tests.swf src/TestMain.as
```

When you compile, you may see the following warning:

> Warning: The definition mx.utils.ObjectUtil depended on by flexunit.framework.Assert in the SWC /Users/joshtynjala/Development/flash/github-actions-flexunit-air-sdk-sample/flexunit/flexunit/flexunit-4.2.0-20140410-as3_4.12.0.swc could not be found

Do not worry. It seems that this `mx.utils.ObjectUtil` class from the Flex SDK is used by FlexUnit in very specific, limited circumstances only. In all my years of using FlexUnit, I have never encountered an exception thrown at run-time because this class was missing.

Then, you can run your tests using the AIR Debug Launcher.

## Credits

This sample created by [Josh Tynjala](https://twitter.com/joshtynjala), the author of [Feathers UI](https://feathersui.com/).
