ActiveAdmin.register Movie do
  actions :show, :index

  collection_action :update_catalog, method: :get do
    Movie.update_catalog
    redirect_to admin_movies_path
  end

  action_item :update_catalog do
    link_to('Update Catalog', update_catalog_admin_movies_path)
  end

  index do
    column :title
    column :overview
    column :vote_average

    actions
  end
end
