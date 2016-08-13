Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '676197535871171', '65ff24e7549844830aeb45c83060de6e'
end
