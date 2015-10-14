lock '3.2.1'

set :application, ''
set :repo_url, 'git@example.com:me/my_repo.git'

set :branch, 'master'

set :deploy_to, '/somewhere'

set :linked_files, %w{config/application.yml}

set :keep_releases, 5

namespace :deploy do
  after :publishing, :schedule do
  end
end
