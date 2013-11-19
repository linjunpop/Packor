class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :ipa_file
      t.string :name
      t.string :bundle_identifier
      t.string :version

      t.timestamps
    end
  end
end
