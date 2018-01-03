# Reproducing

Ensure you have `bazel` already installed. If you don't and you do
have `nix` package manager or you want to use the exact same version
of `bazel` as I'm using, see the bottom of README.

```
$ cd git@github.com:Fuuzetsu/bazel-trans-classpath-repro.git
$ cd bazel-trans-classpath-repro
$ bazel build -s //:sparkle-java-classpath
```

You should see bazel crash:

```
$ bazel build -s //:sparkle-java-classpath
.......
Unhandled exception thrown during build; message: Unrecoverable error while evaluating node 'CONFIGURED_TARGET://:sparkle-java-classpath e0b07f594f95344ddeec7ec7e9d57ff5 (222817643 1402135891)' (requested by nodes )
INFO: Elapsed time: 5.840s
FAILED: Build did NOT complete successfully (16 packages loaded)
java.lang.RuntimeException: Unrecoverable error while evaluating node 'CONFIGURED_TARGET://:sparkle-java-classpath e0b07f594f95344ddeec7ec7e9d57ff5 (222817643 1402135891)' (requested by nodes )
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:415)
	at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:352)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)
Caused by: java.lang.IllegalArgumentException: Invalid EvalException:
java.lang.NullPointerException
	at com.google.devtools.build.lib.rules.java.JavaInfo.getTransitiveCompileTimeJars(JavaInfo.java:224)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at com.google.devtools.build.lib.syntax.FuncallExpression.callMethod(FuncallExpression.java:297)
	at com.google.devtools.build.lib.syntax.DotExpression.eval(DotExpression.java:115)
	at com.google.devtools.build.lib.syntax.DotExpression.doEval(DotExpression.java:54)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:67)
	at com.google.devtools.build.lib.syntax.Eval.execFor(Eval.java:66)
	at com.google.devtools.build.lib.syntax.Eval.execDispatch(Eval.java:198)
	at com.google.devtools.build.lib.syntax.Eval.exec(Eval.java:173)
	at com.google.devtools.build.lib.syntax.UserDefinedFunction.call(UserDefinedFunction.java:88)
	at com.google.devtools.build.lib.syntax.BaseFunction.call(BaseFunction.java:430)
	at com.google.devtools.build.lib.analysis.skylark.SkylarkRuleConfiguredTargetUtil.buildRule(SkylarkRuleConfiguredTargetUtil.java:92)
	at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createRule(ConfiguredTargetFactory.java:345)
	at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createConfiguredTarget(ConfiguredTargetFactory.java:233)
	at com.google.devtools.build.lib.skyframe.SkyframeBuildView.createConfiguredTarget(SkyframeBuildView.java:500)
	at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.createConfiguredTarget(ConfiguredTargetFunction.java:587)
	at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.compute(ConfiguredTargetFunction.java:243)
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:341)
	at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:352)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)

	at com.google.devtools.build.lib.syntax.EvalException.<init>(EvalException.java:112)
	at com.google.devtools.build.lib.syntax.EvalException$EvalExceptionWithJavaCause.<init>(EvalException.java:209)
	at com.google.devtools.build.lib.syntax.EvalException$EvalExceptionWithJavaCause.<init>(EvalException.java:217)
	at com.google.devtools.build.lib.syntax.FuncallExpression.callMethod(FuncallExpression.java:330)
	at com.google.devtools.build.lib.syntax.DotExpression.eval(DotExpression.java:115)
	at com.google.devtools.build.lib.syntax.DotExpression.doEval(DotExpression.java:54)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:67)
	at com.google.devtools.build.lib.syntax.Eval.execFor(Eval.java:66)
	at com.google.devtools.build.lib.syntax.Eval.execDispatch(Eval.java:198)
	at com.google.devtools.build.lib.syntax.Eval.exec(Eval.java:173)
	at com.google.devtools.build.lib.syntax.UserDefinedFunction.call(UserDefinedFunction.java:88)
	at com.google.devtools.build.lib.syntax.BaseFunction.call(BaseFunction.java:430)
	at com.google.devtools.build.lib.analysis.skylark.SkylarkRuleConfiguredTargetUtil.buildRule(SkylarkRuleConfiguredTargetUtil.java:92)
	at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createRule(ConfiguredTargetFactory.java:345)
	at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createConfiguredTarget(ConfiguredTargetFactory.java:233)
	at com.google.devtools.build.lib.skyframe.SkyframeBuildView.createConfiguredTarget(SkyframeBuildView.java:500)
	at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.createConfiguredTarget(ConfiguredTargetFunction.java:587)
	at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.compute(ConfiguredTargetFunction.java:243)
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:341)
	... 4 more
java.lang.RuntimeException: Unrecoverable error while evaluating node 'CONFIGURED_TARGET://:sparkle-java-classpath e0b07f594f95344ddeec7ec7e9d57ff5 (222817643 1402135891)' (requested by nodes )
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:415)
	at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:352)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)
Caused by: java.lang.IllegalArgumentException: Invalid EvalException:
java.lang.NullPointerException
	at com.google.devtools.build.lib.rules.java.JavaInfo.getTransitiveCompileTimeJars(JavaInfo.java:224)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at com.google.devtools.build.lib.syntax.FuncallExpression.callMethod(FuncallExpression.java:297)
	at com.google.devtools.build.lib.syntax.DotExpression.eval(DotExpression.java:115)
	at com.google.devtools.build.lib.syntax.DotExpression.doEval(DotExpression.java:54)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:67)
	at com.google.devtools.build.lib.syntax.Eval.execFor(Eval.java:66)
	at com.google.devtools.build.lib.syntax.Eval.execDispatch(Eval.java:198)
	at com.google.devtools.build.lib.syntax.Eval.exec(Eval.java:173)
	at com.google.devtools.build.lib.syntax.UserDefinedFunction.call(UserDefinedFunction.java:88)
	at com.google.devtools.build.lib.syntax.BaseFunction.call(BaseFunction.java:430)
	at com.google.devtools.build.lib.analysis.skylark.SkylarkRuleConfiguredTargetUtil.buildRule(SkylarkRuleConfiguredTargetUtil.java:92)
	at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createRule(ConfiguredTargetFactory.java:345)
	at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createConfiguredTarget(ConfiguredTargetFactory.java:233)
	at com.google.devtools.build.lib.skyframe.SkyframeBuildView.createConfiguredTarget(SkyframeBuildView.java:500)
	at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.createConfiguredTarget(ConfiguredTargetFunction.java:587)
	at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.compute(ConfiguredTargetFunction.java:243)
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:341)
	at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:352)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)

	at com.google.devtools.build.lib.syntax.EvalException.<init>(EvalException.java:112)
	at com.google.devtools.build.lib.syntax.EvalException$EvalExceptionWithJavaCause.<init>(EvalException.java:209)
	at com.google.devtools.build.lib.syntax.EvalException$EvalExceptionWithJavaCause.<init>(EvalException.java:217)
	at com.google.devtools.build.lib.syntax.FuncallExpression.callMethod(FuncallExpression.java:330)
	at com.google.devtools.build.lib.syntax.DotExpression.eval(DotExpression.java:115)
	at com.google.devtools.build.lib.syntax.DotExpression.doEval(DotExpression.java:54)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:67)
	at com.google.devtools.build.lib.syntax.Eval.execFor(Eval.java:66)
	at com.google.devtools.build.lib.syntax.Eval.execDispatch(Eval.java:198)
	at com.google.devtools.build.lib.syntax.Eval.exec(Eval.java:173)
	at com.google.devtools.build.lib.syntax.UserDefinedFunction.call(UserDefinedFunction.java:88)
	at com.google.devtools.build.lib.syntax.BaseFunction.call(BaseFunction.java:430)
	at com.google.devtools.build.lib.analysis.skylark.SkylarkRuleConfiguredTargetUtil.buildRule(SkylarkRuleConfiguredTargetUtil.java:92)
	at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createRule(ConfiguredTargetFactory.java:345)
	at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createConfiguredTarget(ConfiguredTargetFactory.java:233)
	at com.google.devtools.build.lib.skyframe.SkyframeBuildView.createConfiguredTarget(SkyframeBuildView.java:500)
	at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.createConfiguredTarget(ConfiguredTargetFunction.java:587)
	at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.compute(ConfiguredTargetFunction.java:243)
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:341)
	... 4 more
```

## bazel version

[nix-shell:~/programming/bazel-trans-classpath-repro]$ bazel version
.......
Build label: 0.8.0- (@non-git)
Build target: bazel-out/k8-opt/bin/src/main/java/com/google/devtools/build/lib/bazel/BazelServer_deploy.jar
Build time: Tue Jan 1 00:00:00 1980 (315532800)
Build timestamp: 315532800
Build timestamp as int: 315532800

The exact version of Bazel used was
https://github.com/bazelbuild/bazel/releases/download/0.8.0/bazel-0.8.0-dist.zip .

Bazel used was obtained from [nix](https://nixos.org/nix/) package
manager. The exact version of `nixpkgs` used was
`4026ea9c8afd09b60896b861a04cc5748fdcdfb4`.

If you have `nix`, you can get exactly the same version of `bazel` as
I have by running `nix-shell` inside the repository or just run below
command to have everything done for you.

```
$ nix-shell shell.nix --run 'bazel build -s //:sparkle-java-classpath'
```
