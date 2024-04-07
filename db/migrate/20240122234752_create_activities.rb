# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.references :activity_type, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :tutorial
      t.string :benefits
      t.integer :identifier
      t.integer :intensity
      t.integer :duartion
      t.boolean :sport_medical_restriccion
      t.boolean :sport_muscle_pains
      t.boolean :general_pain
      t.boolean :is_hipertension
      t.boolean :is_asthma
      t.boolean :is_chest_pain
      t.boolean :pain_cardiac
      t.boolean :cardiac_family_pain
      t.boolean :cholesterol_pain
      t.boolean :dizzines_pain
      t.boolean :smoke_pain
      t.boolean :covid_19

      t.timestamps
    end
  end
end
