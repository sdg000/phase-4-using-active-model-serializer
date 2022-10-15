class MovieSerializer < ActiveModel::Serializer
  attributes :title, :year, :length, :director, :description, :poster_url, :summary

  # custom Serializer method for rendering title and sub-description
  def summary
    "#{self.object.title} - #{self.object.description[0..49]}..."
  end
end
