class SubsController < ApplicationController
    before_action :set_sub, only: %i[show edit update destroy require_moderator]
    before_action :require_moderator, only: %i[update edit]

    # GET /subs
    # GET /subs.json
    def index
        @subs = Sub.all
    end

    # GET /subs/1
    # GET /subs/1.json
    def show; end

    # GET /subs/new
    def new
        @sub = Sub.new
    end

    # GET /subs/1/edit
    def edit; end

    # POST /subs
    # POST /subs.json
    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        respond_to do |format|
            if @sub.save
                format.html { redirect_to @sub, notice: 'Sub was successfully created.' }
                format.json { render :show, status: :created, location: @sub }
            else
                format.html { render :new }
                format.json { render json: @sub.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /subs/1
    # PATCH/PUT /subs/1.json
    def update
        respond_to do |format|
            if @sub.update(sub_params)
                format.html { redirect_to @sub, notice: 'Sub was successfully updated.' }
                format.json { render :show, status: :ok, location: @sub }
            else
                format.html { render :edit }
                format.json { render json: @sub.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /subs/1
    # DELETE /subs/1.json
    def destroy
        @sub.destroy
        respond_to do |format|
            format.html { redirect_to subs_url, notice: 'Sub was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_sub
        @sub = Sub.find(params[:id])
    end

    def require_moderator
        if current_user.id != @sub.moderator_id
            flash[:errors] = ['U need to be a moderator']
            redirect_to @sub
        end
    end

    # Only allow a list of trusted parameters through.
    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
