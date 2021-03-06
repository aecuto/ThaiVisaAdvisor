class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @notices = Notice.all
    if current_user.present?
      if current_user.is_family
        @family = current_user.family
        redirect_to family_members_path(@family)
      end
    end
  end

end
