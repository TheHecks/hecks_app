Gem::Specification.new do |s|
  s.name        = 'hecks_app'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'Build an application with a Hecks Domain'
  s.description = 'Uses a hexagonal framework to plugin drivers to a domain'
  s.authors     = ["Hecks App Developer"]
  s.email       = 'support@the_good_guys.com'
  s.files       = Dir['lib/**/*.rb', 'drivers/**/*.rb']
  s.homepage    = 'https://www.trusona.com'

  s.add_dependency 'hecks_domain'
  s.add_dependency 'rspec'
  s.add_dependency 'activerecord'
  s.add_dependency 'sqlite3'
  s.add_dependency 'pry'
  s.add_dependency 'aws-sdk-dynamodb'
end
