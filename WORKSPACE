maven_jar(
  name = "com_esotericsoftware_kryo_shaded",
  artifact = "com.esotericsoftware:kryo:3.0.3",
)

maven_jar(
  name = "org_apache_spark_spark_core",
  artifact = "org.apache.spark:spark-core_2.11:2.2.0",
)

new_http_archive(
  name = "io_tweag_sparkle",
  strip_prefix = "sparkle-cdeb0add545d5c4641e58518f141cb6a62f302d3",
  urls = ["https://github.com/tweag/sparkle/archive/cdeb0add545d5c4641e58518f141cb6a62f302d3.tar.gz"],
  build_file_content = """
java_binary(
  name = "sparkle-jar",
  deps = [
    "@org_apache_spark_spark_core//jar",
    "@com_esotericsoftware_kryo_shaded//jar",
  ],
  srcs = glob(["src/main/java/io/tweag/sparkle/**/*.java"]),
  main_class = "io.tweag.sparkle.SparkMain",
  visibility = ["//visibility:public"],
)
"""
)
