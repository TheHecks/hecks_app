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
A driver that will map a Hecks Domain to Dynamodb tables and provide repositories for getting and fetching
```
App.config do
  ...
  driver :Dynamodb
end
```

## Current Work
#### DynamoDB Driver

## Backlog
### High Priority
1. Create a facilitator app
1. What does a data port look like?
1. Application Port
1. Rails Demo

### Icebox
1. Unit Tests for hecks domain
1. Make a Logger 'Driven'
1. Dynamic SQL Driver
1. Lambda Driver
1. Value Store in Hecks App
1. Generate a crud server (or make a generic one)