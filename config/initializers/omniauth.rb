OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '810074685698919', 'f99d8da007c40f28c3d6ae67bf4a45c7'
end

