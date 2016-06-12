class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_pin
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.pin_id = @pin.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @pin, notice: 'Komentarz dodany pomyślnie.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @pin, notice: 'Komentarz zmodyfikowany pomyślnie.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    # @pin = Pin.find(params[:pin_id])
    # @comment = @pin.comments.find(params[:id])
    
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @pin, notice: 'Komentarz usunięty pomyślnie.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def set_pin
      @pin = Pin.find(params[:pin_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:description)
    end
    
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to pins_path, notice: "Nie jesteś uprawniony do edycji tego komentarza" if @comment.nil?
    end
end
