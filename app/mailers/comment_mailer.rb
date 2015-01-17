class CommentMailer < ApplicationMailer
  default from: "max.alfie15@gmail.com"

  def mail_comment(article, comment)
    @article = article
    @comment = comment
    subject = "A user commented on your post : " + article.title.to_s
    mail(to: "alfie.2012@gmail.com", subject: subject)
  end
end
