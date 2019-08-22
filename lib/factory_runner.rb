module SoccerSeasonApp
  class FactoryRunner
    def initialize(aggregate:)
      @aggregate = aggregate
    end

    def method_missing(name, *args)
      @aggregate.const_get(name.to_s.split('_')[1].capitalize).new(args.first)
    end
  end
end
