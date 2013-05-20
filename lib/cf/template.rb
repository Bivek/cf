module CF
  class Template
    attr_accessor :template_id, :name

    def initialize(template_id, name = nil)
      @template_id = template_id
      @name        = name
    end

    def create_task(client, resources, callback_url = nil, sandbox = false)
      Task.create(client, @template_id, resources, callback_url = nil, sandbox = false)
    end

  end
end
