class CreateUserParametrizations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_parametrizations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :weight
      t.string :height
      t.string :imc
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
