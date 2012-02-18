class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.order(:priority).where(:user_id => current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.where(:id => params[:id], :user_id => current_user.id).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end
  
  def new_from_list
    if params[:list]
      params[:list].split(/\n/).each do |task|
        task = task.strip
        if task.length > 0
          t = Task.new(:title => task, :user_id => current_user.id, :done => 0)
          t.save
          t.priority = t.id
          t.save
        end
      end       
      redirect_to :tasks, :notice => "Your task list has been saved"
    else  
      render "new_task_list.html.erb"
    end  
  end
  
  def do_tasks
    if params[:done]
      task = Task.where(:user_id => current_user.id, :id => params[:done]).first
      task.done = 1
      task.save
    end  
  
    @task = Task.where(:user_id => current_user.id, :done => 0).order(:priority).first
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.where(:id => params[:id], :user_id => current_user.id).first
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        @task.priority = @task.id and @task.user_id = current_user.id and @task.save
         
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.where(:id => params[:id], :user_id => current_user.id).first

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.where(:id => params[:id], :user_id => current_user.id).first
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  def move_down
    @task = Task.where(:id => params[:id], :user_id => current_user.id).first
    @task.move_down
    
    redirect_to :tasks  
  end
  
  def move_up
    @task = Task.where(:id => params[:id], :user_id => current_user.id).first
    @task.move_up
    @task.save  
    
    redirect_to :tasks
  end
  
  def toggle_status
    @task = Task.where(:id => params[:id], :user_id => current_user.id).first
    @task.done = @task.done==0 ? 1 : 0
    @task.save  
    
    redirect_to :tasks
  end
  
end
