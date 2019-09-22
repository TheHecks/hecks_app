Gem::Specification.new do |s|
  s.name        = 'hecks-app'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'Build an application with a Hecks Domain'
  s.description = 'Uses a hexagonal framework to plugin adapters to a domain'
  s.authors     = ['Hecks App Developer']
  s.email       = 'support@the_good_guys.com'
  s.files       = Dir['lib/**/*.rb', 'adapters/**/*.rb']
  s.homepage    = 'https://www.example.com'

  s.add_dependency 'activerecord', '~> 5.2'
  s.add_dependency 'hecks-domain', '0.1.0'
end
