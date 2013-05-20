require 'httparty'

module CF
  class Client
    include HTTParty

    attr_reader :callback_url

    format :json

    class ResponseParser < HTTParty::Parser
      SupportedFormats = {
        'application/json'       => :json,
        'text/json'              => :json,
        'application/javascript' => :json,
        'text/javascript'        => :json,
      }

      def parse
        decoded_body = MultiJson.decode(body)

        # Catch and raise errors as necessary
        if decoded_body.is_a?(Hash) and decoded_body['error']
          raise GetHumanoid::Error, decoded_body
        end

        return decoded_body
      end
    end

    parser ResponseParser

    def initialize(config)
      @public_key   = config['public_key']
      @private_key  = config['private_key']
      @path         = config['path'] || 'https://gethumanoid.com/v3'
      @callback_url = config['callback_url']

      self.class.basic_auth @public_key, @private_key
      self.class.base_uri @path
    end

    # Fetch a list of tasks
    def tasks
      return self.class.get('/tasks').parsed_response.map do |task|
        Task.new(
          task['task_id'],
          task['template_id'],
          task['status'],
          task['started_at']
        )
      end
    end

    # Fetch a single task
    def task(task_id)
      task = self.class.get("/tasks/%s" % task_id).parsed_response

      return Task.new(
        task['task_id'],
        task['template_id'],
        task['status'],
        task['started_at']
      )
    end

    # Fetch a list of templates
    def templates
      return self.class.get('/templates').parsed_response.map do |template|
        Template.new(template['template_id'], template['name'])
      end
    end

  end
end
