class NotesController < ApplicationController
    before_action :set_note, only: %i[show edit update destroy]

    # GET /notes
    # GET /notes.json
    def index
        @notes = Note.all
    end

    # GET /notes/1
    # GET /notes/1.json
    def show; end

    # GET /notes/new
    def new
        @note = Note.new
    end

    # GET /notes/1/edit
    def edit; end

    # POST /notes
    # POST /notes.json
    def create
        @note = Note.new(note_params)
        @note[:user_id] = current_user.id
        respond_to do |format|
            @note.save
            format.html { redirect_to track_url(@note.track_id), notice: 'Note was successfully created.' }
        end
    end

    # PATCH/PUT /notes/1
    # PATCH/PUT /notes/1.json
    def update
        respond_to do |format|
            if @note.update(note_params)
                format.html { redirect_to @note, notice: 'Note was successfully updated.' }
                format.json { render :show, status: :ok, location: @note }
            else
                format.html { render :edit }
                format.json { render json: @note.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /notes/1
    # DELETE /notes/1.json
    def destroy
        @note.destroy
        respond_to do |format|
            format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_note
        @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
        params.require(:note).permit(:user_id, :track_id, :note)
    end
end
