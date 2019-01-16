class UserAuthenticationSerializer < ActiveModel::Serializer
  root 'user'
  attributes :auth_token
end
