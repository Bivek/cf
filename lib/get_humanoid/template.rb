module GetHumanoid
  class Template
    attr_accessor :template_id, :name

    def initialize(template_id, name = nil)
      @template_id = template_id
      @name        = name
    end

    # Send a batch of data to Humanoid.  See
    # https://gethumanoid.com/v3/docs/tasks for details.
    def create_task(client, callback_url, resources, sandbox = false)
      post_data = {
        :template_id  => @template_id,
        :callback_url => callback_url,
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
