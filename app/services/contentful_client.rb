# DO NOT TOUCH!
# Assume this class comes from a gem out of our control, calling an external service
class ContentfulClient
  Article = Struct.new(:title, :body)

  ARTICLES = {
    1 => Article.new('Wonderful service', 'Evan MacNally, Aviemore.'),
    2 => Article.new('Very helpful!', 'Gwyneth Duncan, Conwy.'),
    3 => Article.new('Best company in the business', 'John Smith, Plymouth.'),
    4 => Article.new('Highly recommended', "Sonia Ayoade, Bishop's Stortford."),
  }.freeze

  def self.fetch(ids)
    ids.map { |id| ARTICLES[id] }
  end
end
