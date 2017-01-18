class ProgrammeSessionsController < ApplicationController
  before_action :set_programme_session,
    only: [
      :show, :edit, :update, :destroy, :register, :create_registration,
      :show_registration
    ]

  # GET /programme_sessions
  # GET /programme_sessions.json
  def index
    @programme_sessions = ProgrammeSession.all
  end

  # GET /programme_sessions/1
  # GET /programme_sessions/1.json
  def show
    @lecturers_by_modules = @programme_session.modules.map{|m| [m.name, m.registrations.count, @programme_session.modules.find(m.id).registrations.map{|r| r.user.email}]}
  end

  # GET /programme_sessions/new
  def new
    @programme_session = ProgrammeSession.new
  end

  # GET /programme_sessions/1/edit
  def edit
  end

  # POST /programme_sessions
  # POST /programme_sessions.json
  def create
    @programme_session = ProgrammeSession.new(programme_session_params)
    @programme_session.modules << ProgrammeModule.all
    respond_to do |format|
      if @programme_session.save
        format.html { redirect_to @programme_session, notice: 'Programme session was successfully created.' }
        format.json { render :show, status: :created, location: @programme_session }
      else
        format.html { render :new }
        format.json { render json: @programme_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programme_sessions/1
  # PATCH/PUT /programme_sessions/1.json
  def update
    respond_to do |format|
      if @programme_session.update(programme_session_params)
        format.html { redirect_to @programme_session, notice: 'Programme session was successfully updated.' }
        format.json { render :show, status: :ok, location: @programme_session }
      else
        format.html { render :edit }
        format.json { render json: @programme_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programme_sessions/1
  # DELETE /programme_sessions/1.json
  def destroy
    @programme_session.destroy
    respond_to do |format|
      format.html { redirect_to programme_sessions_url, notice: 'Programme session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /programme_sessions/1/register
  # GET /programme_sessions/1/register.json
  def register
    @registration = Registration.new
    @programme_modules_by_category = ProgrammeModule.all.group_by{ |m| m.category.name }
  end

  def create_registration
    @registration = Registration.new(registration_params)
    @registration.user = current_user
    @registration.programme_session = @programme_session
    respond_to do |format|
      if @registration.save
        format.html { redirect_to pages_home_path, notice: 'Successfully registered for programme' }
        format.json { render :show, status: :created, location: @programme_session }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_registration
    @registration = Registration.find(params[:registration_id])
    @programme_modules_by_category = @registration.programme_modules.group_by{ |m| m.category.name }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programme_session
      @programme_session = ProgrammeSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programme_session_params
      params.require(:programme_session).permit(:name, :start_date, :end_date, :active, :completed)
    end

    def registration_params
      params.require(:registration).permit(:weekly_teaching_hours, :required_venue, :required_stationery, :required_equipment, :additional_notes, :venue_id, :other_venue, :programme_module_ids => [])
    end



end
