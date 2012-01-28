module GetHumanoid
  class Client
    include HTTParty

    # HTTParty Params
    format :json
    base_uri 'https://gethumanoid.com/v3'
    # Does this work?
    basic_auth @public_key, @private_key

    # TODO: should I use this?
    parser ResponseParser

    def initialize(config)
      @public_key  = config['public_key']
      @private_key = config['private_key']
    end

    # Convenience method for httparty, is this needed above?
    def auth
      {
        :username => @public_key,
        :password => @private_key,
      }
    end

    # Fetch a list of tasks
    def tasks
      self.class.get('/tasks')
    end

    def task(task_id)
      self.class.get("/tasks/%s" % task_id)

      # TODO
      task = Task.new()

      return task
    end

    def templates
      response = self.class.get('/templates')

      # Todo
      templates = []

      return templates
    end

    # TODO, should I use HTTParty's parser?
    def response_handler
    end

    class ResponseParser < HTTParty::Parser
      def parse
        # TODO: for now, this is a passthrough parser
        body
      end
    end

    class Task
      attr_accessor :task_id, :template_id, :callback_url, :sandbox, :resources, :status, :started_at
      
      def initialize(template_id)
        @template = template_id
        @sandbox  = true
      end

      def post(client, resources)
        # TODO: validation of stuff like callback_url

        post_data = {
          :template_id  => @template.template_id,
          :callback_url => @callback_url,
          :sandbox      => @sandbox,
          :resources    => resources,
        }

        response = client.post('/v3/tasks', :query => post_data)

        response_handler(response)
      end
    end

    class Template
      attr_accessor :template_id, :name

      def initialize(template_id, name)
        @template_id = template_id
        @name        = name
      end
    end

  end
end
