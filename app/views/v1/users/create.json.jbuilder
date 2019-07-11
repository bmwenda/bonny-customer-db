if @user.errors.present?
  json.errors @user.errors
else
  json.token @token
end
