Pod::Spec.new do |s|
  s.name = 'XPD_FMDB'
  s.version = '2.6.3'
  s.summary = 'A Cocoa / Objective-C wrapper around SQLite.'
  s.homepage = 'https://github.com/ccgus/fmdb'
  s.license = 'MIT'
  s.author = { 'August Mueller' => 'gus@flyingmeat.com' }
  s.source = { :git => 'https://github.com/ccgus/fmdb.git', :tag => 'v2.3' }
  s.requires_arc = true
  s.default_subspec = 'standard'
  s.platform = :ios, '5.0'
  s.xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

  s.public_header_files = 'src/fmdb/FM*.h'

  # use a builtin version of sqlite3
  s.subspec 'standard' do |ss|
    ss.library = 'sqlite3'
    ss.source_files = 'src/fmdb/FM*.{h,m}'
    ss.exclude_files = 'src/fmdb.m'
  end

  # use a custom built version of sqlite3, with FTS4 enabled
  s.subspec 'standalone' do |ss|
    ss.dependency 'sqlite3/fts'
    ss.source_files = 'src/fmdb/FM*.{h,m}'
    ss.exclude_files = 'src/fmdb.m'
  end

  # use SQLCipher and enable -DSQLITE_HAS_CODEC flag
  s.subspec 'SQLCipher' do |ss|
    ss.dependency 'SQLCipher'
    ss.source_files = 'src/fmdb/FM*.{h,m}'
    ss.exclude_files = 'src/fmdb.m'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC' }
  end
  
end
