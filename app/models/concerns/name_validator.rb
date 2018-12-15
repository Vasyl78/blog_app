# frozen_string_literal: true

class NameValidator < ActiveModel::Validator
  def validate(record)
    return if /[A-Z][a-z]+\s([a-z]{2,}\s?)+\./.match?(record.name)

    if record.name.blank?
      record.errors.add(:name, 'Name is required')
    else
      record.errors.add(:name, "name should be in format 'Big post.'")
    end
  end
end
