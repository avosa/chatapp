# module JobsHelper
#   def likers_of(job)
#     votes = job.votes_for.up.by_type(User)
#     user_names = []
#     unless votes.blank?
#       votes.voters.each do |voter|
#         user_names.push(link_to voter.user_name,
#                                 profile_path(voter.user_name),
#                                 class: 'user-name')
#       end
#       user_names.to_sentence.html_safe + like_plural(votes)
#     end
#   end
#
#   def liked_job(job)
#     return 'glyphicon-heart' if current_user.voted_for? job
#     'glyphicon-heart-empty'
#   end
#
#   private
#
#   def like_plural(votes)
#     return ' like this' if votes.count > 1
#     ' likes this'
#   end
# end
module JobsHelper
  def display_likes(job)
    votes = job.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 8
    count_likers(votes)
  end

  def liked_job(job)
    return 'glyphicon-heart' if current_user.voted_for? job
    'glyphicon-heart-empty'
  end

  private

  def list_likers(votes)
    user_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        user_names.push(link_to voter.user_name,
                                profile_path(voter.user_name),
                                class: 'user-name')
      end
      user_names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s + ' likes'
  end

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
