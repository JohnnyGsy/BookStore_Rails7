class BookDecorator < Draper::Decorator
  TRUNCATED_LENGTH = { description: 150,
                       all_authors_fullname: 15,
                       title: 20 }.freeze
  delegate_all
  decorates_association :authors

  def authors_names
    authors.map(&:full_name).join(', ')
  end

  def short_description
    description.truncate(TRUNCATED_LENGTH[:description], separator: ' ')
  end

  def short_title
    title.truncate(TRUNCATED_LENGTH[:title], separator: ' ')
  end

  def short_authors_names
    authors_names.truncate(TRUNCATED_LENGTH[:all_authors_fullname], separator: ' ')
  end
end
