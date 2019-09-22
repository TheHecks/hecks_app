# Hecks App
A Hexagonal application framework for working with Domains designed with HecksDomain.

## Application Port
The application port serves up all the commands available for all aggregates in the domain.

### Commands
```
App::Matches.add_goal!(
  match, 
  player: player, 
  time: Time.now
)
```

## Driven Adapters
### Dynamodb
An adapter that will map a Hecks Domain to Dynamodb tables and provide repositories for getting and fetching
```
App.config do
  ...
  adapter :Dynamodb
end
```