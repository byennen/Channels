class RegistrationsController < Devise::RegistrationsController
  before_filter :load_channels
end
