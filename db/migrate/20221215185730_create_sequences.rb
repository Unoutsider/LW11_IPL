class CreateSequences < ActiveRecord::Migration[7.0]
  def change
    create_table :sequences, id: false do |t|
      t.string :enteredseq, null: false
      t.string :subseq
      t.string :maxseq

      t.timestamps
    end
    execute('ALTER TABLE sequences ADD PRIMARY KEY(enteredseq);')
    add_index :sequences, [:enteredseq], unique: true
  end
end
