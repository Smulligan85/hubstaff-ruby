class Hubstaff::Client
  module Note

    def notes(start_time, stop_time, options={})
      notes = connection.get("notes") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = stop_time
        req.params['organizations'] = options[:orgs] unless options[:orgs].nil?
        req.params['projects'] = options[:projects] unless options[:projects].nil?
        req.params['users'] = options[:users] unless options[:users].nil?
        req.params['offset'] = options[:offset] unless options[:offset].nil?
      end
      note_json = JSON.parse(notes.body)
      note_json
    end

    def find_note(note_id)
      note = get_json("notes/#{note_id}")
      note
    end
  end
end

