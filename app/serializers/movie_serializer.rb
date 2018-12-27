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
end
