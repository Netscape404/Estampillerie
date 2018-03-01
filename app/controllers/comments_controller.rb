class CommentsController < ApplicationController
  before_action :find_project
  before_action :find_comment, only: [:destroy, :edit, :update]

  # GET /comments/1/edit
    def edit
    end

    # POST /comments
    def create
      @comment = @project.comments.create(params[:comment].permit(:content))
      @comment.user_id = current_user.id
      @comment.save

      if @comment.save
        redirect_to project_path(@project)
      else
        render 'new'
      end
    end

    # PATCH/PUT /comments/1
    def update
      if @comment.update(params[:comment].permit(:content))
        redirect_to project_path(@project)
      else
        render 'edit'
      end
    end

    # DELETE /comments/1
    def destroy
      @comment.destroy
      redirect_to project_path(@project)
    end

    private

    def find_project
      @project = Project.find(params[:project_id])
    end

    def find_comment
      @comment = @project.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :project_id)
    end

  end
