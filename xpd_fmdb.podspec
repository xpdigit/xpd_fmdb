Pod::Spec.new do |s|
  s.name = 'xpd_fmdb'
  s.version = '2.6.3'
  s.summary = 'A Cocoa / Objective-C wrapper around SQLite.'
  s.homepage = 'https://github.com/ccgus/fmdb'
  s.license = 'MIT'
  s.author = { 'August Mueller' => 'gus@flyingmeat.com' }
  s.source = { :git => 'https://github.com/ccgus/fmdb.git', :tag => 'v2.3' }
  s.requires_arc = true
  s.platform = :ios, '5.0'
  s.xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

  s.public_header_files = 'src/fmdb/FM*.h'

  # use a builtin version of sqlite3
  s.library = 'sqlite3'
  s.source_files = 'src/fmdb/FM*.{h,m}'
  s.exclude_files = 'src/fmdb.m'
  
end
