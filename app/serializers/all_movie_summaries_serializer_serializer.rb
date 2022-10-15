class AllMovieSummariesSerializerSerializer < ActiveModel::Serializer
  attributes :all_summaries

  def all_summaries
    "#{self.object.title} - #{self.object.description[0..49]}..."

  end
end
