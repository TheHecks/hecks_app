class ApplicationPort
  class CommandRunner
    def self.run(app_module, args)
      domain_aggregate = SoccerSeason.const_get(app_module.to_s.split('::').last)
      head = domain_aggregate::Head.new(args)
      result = head.save!
      args.merge(id: result.instance_variable_get(:@id))
    end
  end
end