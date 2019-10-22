class AddInitialModels < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :players do |t|
      t.integer :ifpa_number
      t.string :email
      t.boolean :active
      t.references :user
      t.references :league
      t.timestamps

      t.index [:leagues, :active]
    end

    create_table :locations do |t|
      t.string :name
      t.string :description
      t.boolean :active
      t.references :league
      t.timestamps

      t.index [:leagues, :active]
    end

    create_table :machines do |t|
      t.string :name
      t.string :short_name
      t.integer :ipdb_number
      t.integer :pintips_number
      t.boolean :active
      t.references :league
      t.references :location
      t.timestamps

      t.index [:leagues, :active]
      t.index [:locations, :active]
    end

    create_table :seasons do |t|
      t.string :name
      t.integer :meet_count
      t.integer :drop_meets
      t.integer :split_meet
      t.integer :minimum_eligibility_meets
      t.datetime :start_date
      t.datetime :end_date
      t.references :league
      t.timestamps
    end

    create_table :seasons_scoring_rules do |t|
      t.integer :player_count
      t.references :season
      t.timestamps
    end

    create_table :scoring_rules do |t|
      t.integer :position
      t.integer :value
      t.references :seasons_scoring_rule
      t.timestamps
    end

    create_table :divisions do |t|
      t.string :name
      t.integer :player_count
      t.integer :eligibile_count
      t.references :season
      t.timestamps
    end

    create_table :players_divisions do |t|
      t.references :player
      t.references :division
      t.timestamps
    end

    create_table :players_scores do |t|
      t.integer :total_score
      t.integer :adjusted_score
      t.references :player
      t.references :season
      t.references :division
      t.timestamps
    end

    create_table :meets do |t|
      t.integer :number
      t.datetime :played_on
      t.references :season
      t.timestamps
    end

    create_table :matches do |t|
      t.references :meet
      t.references :location
      t.timestamps
    end

    create_table :players_matches do |t|
      t.integer :number
      t.references :player
      t.references :match
      t.timestamps
    end

    create_table :machines_matches do |t|
      t.integer :number
      t.references :machine
      t.references :match
      t.timestamps
    end

    create_table :scores do |t|
      t.references :match
      t.references :machine
      t.references :player
      t.references :season
      t.timestamps
    end

  end
end
