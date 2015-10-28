lock '3.4.0'

set :branch, 'master'
set :deploy_to, '/somewhere'
set :keep_releases, 5
set :linked_files, %w{config/application.yml}
set :repo_url, 'git@example.com:me/my_repo.git'

namespace :deploy do
  after :publishing, :schedule do
  end
end
