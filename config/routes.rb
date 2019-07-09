require 'api_version'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :v1, constraints: ApiVersion.new(version: 1, default: true), subdomain: 'api', defaults: { format: :json } do
  end
end
