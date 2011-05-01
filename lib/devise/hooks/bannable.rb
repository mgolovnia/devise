Warden::Manager.after_set_user do |record, warden, options|
  if record && record.class.respond_to?(:bannable?) && record.banned?
    scope = options[:scope]
    warden.logout(scope)
    throw :warden, :scope => scope, :message => record.banned_message
  end
end
