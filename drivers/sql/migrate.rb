class CreateDatabase < ActiveRecord::Migration[5.0]
  def up
    create_table :matches_matches, force: true do |t|
      t.integer :fixture_id
      t.integer :value_id
      t.integer :pitch_id
      t.integer :result_id
    end

    create_table :matches_fixtures, force: true do |t|
      t.string :season
      t.date :date
      t.time :time
    end

    create_table :matches_goals, force: true do |t|
      t.time :time
      t.integer :player_id
      t.integer :match_id
    end

    create_table :matches_results, force: true do |t|
      t.integer :loser_id
      t.integer :winner_id
      t.integer :match_id
    end

    create_table :teams_teams, force: true do |t|
      t.string :name
    end

    create_table :matches_matches_teams_teams, force: true do |t|
      t.integer :match_id
      t.integer :team_id
    end
  end
end
