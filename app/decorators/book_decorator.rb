class BookDecorator < Draper::Decorator
  TRUNCATED_LENGTH = { description: 250 }.freeze
  delegate_all
  decorates_association :authors

  def authors_names
    authors.map(&:full_name).join(', ')
  end

  def short_description
    description.truncate(TRUNCATED_LENGTH[:description], separator: ' ')
  end
end
