class BookDecorator < Draper::Decorator
  delegate_all
  decorates_association :authors

  def authors_names
    authors.map(&:full_name).join(', ')
  end
end
