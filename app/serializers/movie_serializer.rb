class MovieSerializer < ActiveModel::Serializer
  attributes :id, :poster_path,
    :adult,
    :overview,
    :release_date,
    :original_title,
    :original_language,
    :title,
    :backdrop_path,
    :popularity,
    :vote_count,
    :video,
    :vote_average

  attribute :genre_ids do
    object.genres.map { |g| g.genre_id }
  end
end
