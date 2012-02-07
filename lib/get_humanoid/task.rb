module GetHumanoid
  class Task
    attr_accessor :task_id, :template_id, :status, :started_at
    
    def initialize(task_id, template_id, status, started_at)
      @task_id    = task_id
      @template   = template_id
      @status     = status
      @started_at = started_at
    end

  end
end
