module Admins::InterviewHelper
end

def get_message(category)
  Option.where(category: category).pluck(:message)
end

def get_email
  User.where(admin: 1).pluck(:email)
end
