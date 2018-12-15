# frozen_string_literal: true

class AuthorNameValidator < ActiveModel::Validator
  def validate(record)
    return if /([A-Z][a-z]+\s?){2,}\./.match?(record.author)

    if record.author.empty?
      record.errors.add(:author, 'Author is required')
    else
      record.errors.add(:author, "Author should be in format 'John Taylor.'")
    end
  end
end
