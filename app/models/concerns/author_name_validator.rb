# frozen_string_literal: true

class AuthorNameValidator < ActiveModel::Validator
  def validate(record)
    return if /([A-Z][a-z]+\s?){2,}\./.match?(record.author)

    record.errors.add(:author, "Name should be in format 'John Taylor.'")
  end
end
