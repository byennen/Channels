class SessionsController < Devise::SessionsController
  before_filter :load_channels
end
