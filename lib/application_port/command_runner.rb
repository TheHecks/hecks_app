class CommandRunner
  attr_reader :domain_object
  def initialize(domain_object)
    @domain_object = domain_object
  end

  def run(name, *args)
    @domain_object.send(name, *args)
  end

  def method_missing(name, *args)
    run(name, *args)
  end
end
