Gem::Specification.new do |s|
  s.name        = 'testraf'
  s.version     = '0.0.2'
  s.date        = '2013-05-07'
  s.summary     = "Why make a walrus test you code when a giraffe can do it?"
  s.description = "A gem for testing solutions to problems in informatics competitions."
  s.authors     = ["Svend Christian Svendsen"]
  s.email       = 'svendcsvendsen@gmail.com'
  s.files       = ["lib/testraf.rb", "lib/testraf/command.rb", "lib/testraf/report.rb", "lib/testraf/test.rb"]
  s.executables << "testraf"
  #s.add_dependency('colorize')
  #s.add_dependency('open4')
  s.homepage    =
    'http://rubygems.org/gems/testraf'
end