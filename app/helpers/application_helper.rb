module ApplicationHelper
  def self.user_short_link(context, user, mode)
    case mode
    when "real"
      return context.link_to user.name, user
    when "pseudo"
      return context.link_to user.pseudonym, "/pseudo/#{user.pseudonym}"
    when "anon"
      return "Anonymous"
    end
  end
end
