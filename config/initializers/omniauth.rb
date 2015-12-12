OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '476350022395766', '9e6d94e19e6520056abca4d2c37aec38'
end