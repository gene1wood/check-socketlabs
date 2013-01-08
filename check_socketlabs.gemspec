# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "check_socketlabs"
  s.version     = "0.0.1"
  s.authors     = ["Gene Wood"]
  s.email       = ["gene_wood@cementhorizon.com"]
  s.homepage    = "https://github.com/gene1wood/check-socketlabs"
  s.summary     = %q{Nagios plugin to check SocketLabs email queue processing health}
  s.description = %q{This is a nagios plugin that interacts with the SocketLabs API 
to enable monitoring of a SocketLabs account. The plugin fetches the count of 
messages that have been queued to be processed (sent to SocketLabs) and the 
count of messages that have been processed (accepted by the recipients MTA) 
and checks that the percentage of queued messages that have not yet been 
processed is below a given threshold.}

  s.rubyforge_project = "check_socketlabs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "socketlab" # https://github.com/amardaxini/socketlab
  s.add_runtime_dependency "trollop"
end
