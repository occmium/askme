class CreateJoinTableQuestionHashtag < ActiveRecord::Migration[5.2]
  def change
    create_join_table :questions, :hashtags do |t|
      t.index [:question_id, :hashtag_id], unique: true
    end
  end
end
