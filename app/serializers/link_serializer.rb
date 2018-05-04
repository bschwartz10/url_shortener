class LinkSerializer < ActiveModel::Serializer
  attributes :id, :given_url, :slug

  def slug
    object.display_slug
  end

end
