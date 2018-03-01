class ProjectsController < ApplicationController
  load_and_authorize_resource

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @comments = Comment.where(project_id: @project).order('created_at DESC')
  end

  # GET /projects/new
  def new
    @project = Project.new
    @picture = ProjectPicture.new
    @file = ProjectFile.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        if params[:project][:picture]
          params[:project][:picture].each do |picture|
            @picture = ProjectPicture.new
            @picture.picture = picture
            @picture.project_id = @project.id
            @picture.save
          end
        end
        if params[:project][:file]
          params[:project][:file].each do |files|
            @file = ProjectFile.new
            @file.file = files
            @file.project_id = @project.id
            @file.save
          end
        end
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:thumbnail, :title, :description, :specifications, :difficulty, :category_id, :subcategory_id, {tag_ids:[]})
    end

    def project_picture_params
      params.require(:project_picture).permit(:picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at)
    end

    def project_file_params
      params.require(:project_file).permit(:file_file_name, :file_content_type, :file_file_size, :file_updated_at)
    end
end
