# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
  
Gem::Specification.new do |spec|
  spec.name           = "ex50"
  spec.versions       = '1.0'
  spec.authors        = ["Jeffrey XIE"]
  spec.email          = ["xwy5201314@gmail.com"]
  spec.summary        = %q{Short summary of your project}
  spec.description    = %q{Longer description of your project.}
  spec.homepage       = "http://domainforproject.com/"
  spec.license        = "MIT"
  
  spec.files          = ['lib/gothonweb/map.rb']
  spec.executables    = ['bin/app']
  spec.test_files     = ['tests/test_map.rb']
  spec.require_paths  = ["lib"]
end