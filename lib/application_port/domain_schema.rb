module HecksApp
  gem_dir = Gem::Specification.find_by_name(ApplicationPort.domain.to_s.underscore).gem_dir
  DOMAIN_SCHEMA =
    instance_eval(File.open("#{gem_dir}/Domainfile").read)
    .instance_variable_get(:@parser)
    .domain.freeze
end
