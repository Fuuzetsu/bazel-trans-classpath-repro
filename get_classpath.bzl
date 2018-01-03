def _get_classpath_impl(ctx):
  cpath = ctx.actions.declare_file("classpath")

  path = dict()
  print(ctx.attr.dep)
  for jar in ctx.attr.dep[JavaInfo].transitive_compile_time_jars:
    path[jar.path] = None

  ctx.actions.write(
    output = cpath,
    content = ":".join(path.keys()),
    is_executable = False
  )

  return DefaultInfo(files = [cpath])

get_classpath = rule(
  _get_classpath_impl,
  attrs = {
    "dep": attr.label(
      mandatory = True,
    )
  }
)
