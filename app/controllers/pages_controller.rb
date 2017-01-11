class PagesController < ApplicationController
  def home
    @open_sessions = ProgrammeSession.active
  end
end
