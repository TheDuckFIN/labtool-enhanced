class AddColumnsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :irc_channel, :string
    add_column :courses, :registeration_open, :boolean

    add_column :courses, :leader_id, :integer
    add_index :courses, :leader_id
  end
end
