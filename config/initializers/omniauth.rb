# MIDDLEWARE - ALLOWS APPLICATION TO VISIT /auth/google_oauth2 FOR AUTHENTICATION
# NEED DOT ENV FILE TO PUT CLIENT ID AND CLIENT SECRET INTO

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"],ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true
end