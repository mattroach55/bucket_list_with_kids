Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

Algolia

To Reindex the models and update Algolia

1. Rails.application.eager_load! # Ensure all models are loaded (required in development).

2. algolia_models = ActiveRecord::Base.descendants.select{ |model| model.respond_to?(:reindex) }

OR

[Accommodation, Destination, Experience].map { |e| e.reindex! }

3. algolia_models.each(&:reindex)

If you target a single index from several models, you must never use MyModel.reindex and only use MyModel.reindex!. The reindex method uses a temporary index to perform an atomic reindexing: if you use it, the resulting index will only contain records for the current model because it will not reindex the others.
