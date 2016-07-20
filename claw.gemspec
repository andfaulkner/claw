Gem::Specification.new do |s|
  s.name          = 'claw'
  s.version       = '0.0.0'
  s.date          = '2016-07-20'
  s.summary       = 'Hack and slash text files from the terminal'
  s.description   = 'Terminal utilities for manipulating text files. Prepend, append, replace, or delete lines on regex matches in text files'
  s.authors       = ['Andrew Faulkner']
  s.email         = 'andfaulkner@gmail.com'
  s.files         = [`git ls-files`.split($OUTPUT_RECORD_SEPARATOR)]
  s.homepage      = 'http://rubygems.org/gems/claw'
  s.license       = 'MIT'
  s.executables   = ['claw']
  s.require_paths = ['lib']
end
