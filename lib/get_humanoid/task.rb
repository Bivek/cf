module GetHumanoid
  class Task
    attr_accessor :task_id, :template_id, :status, :started_at
    
    def initialize(task_id, template_id, status, started_at)
      @task_id    = task_id
      @template   = template_id
      @status     = status
      @started_at = started_at
    end

    # Send a batch of data to Humanoid.  See
    # https://gethumanoid.com/v3/docs/tasks for details.
    def self.create(client, template_id, resources, callback_url = nil, sandbox = false)
      post_data = {
        :template_id  => template_id,
        :callback_url => callback_url || client.callback_url,
        :resources    => resources,
        :sandbox      => sandbox,
      }

      response = client.class.post('/tasks', :query => post_data).parsed_response

      return Task.new(
        response['task_id'],
        response['template_id'],
        response['status'],
        response['started_at']
      )
    end

  end
end
