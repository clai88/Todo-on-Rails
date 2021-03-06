class TasksController < ApplicationController
  def update
    @task = Task.find_by(id: params["id"])
    @task.update(task_params)

    redirect_to list_path(@task.list.name)
  end

  def completed
    @task = Task.find_by(id: params["id"])

    @task.update(is_completed: Date.today)

    redirect_to list_path(@task.list.name)
  end

  private def task_params
    params.require("task").permit(:name, :due_on, :is_completed)
  end
end
