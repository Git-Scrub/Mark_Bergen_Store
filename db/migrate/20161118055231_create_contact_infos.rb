class CreateContactInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_infos do |t|
      t.string :contact_page_text

      t.timestamps
    end
  end
end
