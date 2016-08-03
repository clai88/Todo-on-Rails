class TasksController < ApplicationController
  def update
    @task = Task.where(id: params["id"])


    @task.first.update(task_params)

    redirect_to show_path
  end

  def destroy
    @task = Task.find(params["id"])
    @task.is_completed !@task.is_completed || true

    redirect_to show_path
  end

  private def task_params
    params.require("task").permit(:name, :due_on, :is_completed)
  end
end
