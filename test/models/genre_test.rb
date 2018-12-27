require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  test "genre must have a name and id" do
    @genre = Genre.new
    assert_not @genre.valid?

    @genre.name = "Gênero"
    assert_not @genre.valid?

    @genre.genre_id = 10
    assert @genre.valid?
  end
end
