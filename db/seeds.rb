20.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: 'test1234',
    )
end

7.times do
  question= Question.create(
    poster_id: User.all.sample(1)[0].id,
    title: Faker::Hipster.sentence(12),
    description: Faker::Lorem.paragraph,
    )
  (rand(4)).times do
    vote = Vote.create(
      voter_id: User.all.sample(1)[0].id,
      votable_id: question.id,
      votable_type: 'Question'
      )

    (rand(4)).times do
      comment = Comment.create(
        commenter_id: User.all.sample(1)[0].id,
        commentable_id: question.id,
        commentable_type: 'Question',
        description: Faker::Hipster.sentence(12),
        )
      (rand(4)).times do
        vote = Vote.create(
          voter_id: User.all.sample(1)[0].id,
          votable_id: comment.id,
          votable_type: 'Comment'
          )
      ##################################################
      (rand(5)).times do
        answer= Answer.create(
          responder_id: User.all.sample(1)[0].id,
          question_id: question.id,
          description: Faker::Lorem.paragraph,
          )
        (rand(3)).times do
          vote = Vote.create(
            voter_id: User.all.sample(1)[0].id,
            votable_id: answer.id,
            votable_type: 'Answer'
            )

          (rand(5)).times do
            comment = Comment.create(
              commenter_id: User.all.sample(1)[0].id,
              commentable_id: answer.id,
              commentable_type: 'Answer',
              description: Faker::Hipster.sentence(12),
              )
            (rand(4)).times do
              vote = Vote.create(
                voter_id: User.all.sample(1)[0].id,
                votable_id: comment.id,
                votable_type: 'Comment'
                )
            end#end answer comment vote
          end #end answer comment
         end # end answer vote

      end #end question

      ####################################################
    end#end comment vote
    end #end comment
  end # end question vote

end #end question
