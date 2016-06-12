class Hubstaff::Client
  module Task

    def tasks(projects="", offset=0)
      @tasks = connection.get("tasks") do |req|
        req.params['projects'] = projects unless projects.empty?
        req.params['offset'] = offset
      end
      @task_json = JSON.parse(@tasks.body)
    end

    def find_task(task_id)
      @task = get_json("tasks/#{task_id}")
    end
  end
end
