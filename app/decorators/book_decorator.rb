class BookDecorator < Draper::Decorator
  TRUNCATED_LENGTH = 250
  delegate_all
  decorates_association :authors

  def authors_names
    authors.map(&:full_name).join(', ')
  end

  def short_description
    description.truncate(TRUNCATED_LENGTH, separator: ' ')
  end
end
