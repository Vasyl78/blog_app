# frozen_string_literal: true

# file - max size 2 Mb (Megabit?) or it is mistake of task?
class FileSizeValidator < ActiveModel::Validator
  def validate(record)
    return unless record.file.attached?

    return if record.file.blob.byte_size <= 2.megabytes

    record.file.purge

    record.errors.add(:file, 'File should be less than 2 megabytes')
  end
end
