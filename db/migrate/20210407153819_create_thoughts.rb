class CreateThoughts < ActiveRecord::Migration[5.2]
  def change
      create_table :thoughts do |t|

        t.string :subject
        t.string :details
        t.string :sentiment

        t.boolean :intrusive
        t.boolean :logical

        t.integer :user_id

    end


    
  end
end
