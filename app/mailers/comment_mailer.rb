class CommentMailer < ApplicationMailer
  def mail_comment(article, comment)
    @article = article
    @comment = comment
    subject = "A user commented on your post : " + article.title.to_s
    mail(to: "alfie.2012@gmail.com", subject: subject)
  end
  # handle_asynchronously :mail_comment, :run_at => Proc.new { 1.minutes.from_now }
end
