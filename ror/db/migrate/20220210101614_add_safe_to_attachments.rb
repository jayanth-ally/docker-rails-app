class AddSafeToAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :attachments, :safe, :boolean
  end
end
