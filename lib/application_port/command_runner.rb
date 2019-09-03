class ApplicationPort
  class CommandRunner
    def self.run(method, app_module, args)
      domain_aggregate = SoccerSeason.const_get(app_module.to_s.split('::').last)
      id = args.delete(:id)
      head = domain_aggregate::Head.default(args)

      id =
        if id
          domain_aggregate::Head::Repository.fetch(id)
        else
          domain_aggregate::Head::Repository.save(head)
        end

      result = head.send(method)
      args.merge(id: id)
    end
  end
end
