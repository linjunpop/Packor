class AddIpaFileTmpToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :ipa_file_tmp, :string
  end
end
