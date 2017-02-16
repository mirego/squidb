Pod::Spec.new do |s|
  s.name = "squidb"
  s.version = "3.2.3-mirego"
  s.summary = "SquiDB is a SQLite database library for Android and iOS"
  s.ios.deployment_target = '7.0'
  #s.osx.deployment_target = '10.9'
  #s.tvos.deployment_target = '9.0'
  
  s.xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/J2ObjC@mirego/dist/include"'
  }

  s.description = <<-DESC
  SquiDB is a cross-platform SQLite database layer for Android and iOS. It is
  designed to make it as easy as possible to work with SQLite databases while
  still enabling the power and flexibility of raw SQL. SquiDB combines typesafe
  objects that represent table rows with object-oriented SQL statement builders
  to make it easy to read and write your data without a bunch of messy SQL
  strings. It also includes built in tools and hooks to help you easily write
  database migrations as well as implement ContentProviders.
DESC

  s.homepage = "https://github.com/yahoo/squidb/wiki"
  s.license = "Apache License 2.0"
  s.author = { "Yahoo Inc." => "email@address.com" }
  s.source = { :git => "https://github.com/mirego/squidb.git", :branch => "mirego-3.2.3" }
  s.source_files = [ "squidb-j2objc/**/*.{h,m}" ]
  s.header_mappings_dir = "squidb-j2objc"
  s.prepare_command = "make clean j2objc"
  s.dependency 'J2ObjC@mirego', '~> 1.0'
  s.libraries = "sqlite3"
end
