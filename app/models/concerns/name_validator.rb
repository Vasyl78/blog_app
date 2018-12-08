# frozen_string_literal: true

class NameValidator < ActiveModel::Validator
  def validate(record)
    return if /[A-Z][a-z]+\s([a-z]{2,}\s?)+\./.match?(record.name)

    record.errors.add(:density, "name should be in format 'Big post'")
  end
end
