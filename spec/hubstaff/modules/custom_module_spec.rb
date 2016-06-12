require 'spec_helper'

class Hubstaff::Client
  describe Custom do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
    end

    describe '#custom_date_team' do
      it "returns a custom team report grouped by date" do
        expect(@client.custom_date_team("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
      end

      it "returns a custom team report grouped by date and specific organizations" do
        expect(@client.custom_date_team("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report grouped by date and specific projects" do
        expect(@client.custom_date_team("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report grouped by date and specific users" do
        expect(@client.custom_date_team("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
      end
      
      it "returns a custom team report grouped by date and show tasks" do
        expect(@client.custom_date_team("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end
      
      it "returns a custom team report grouped by date and show notes" do
        expect(@client.custom_date_team("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end
      
      it "returns a custom team report grouped by date and show archieved" do
        expect(@client.custom_date_team("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end
      
      it "returns a custom team report grouped by date and show tasks" do
        expect(@client.custom_date_team("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end
    end

    describe '#custom_date_my' do
      it "returns a custom individual report by date" do
        expect(@client.custom_date_my("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
      end

      it "returns a custom individual report grouped by date and specific organizations" do
        expect(@client.custom_date_my("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report grouped by date and specific projects" do
        expect(@client.custom_date_my("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report grouped by date and specific users" do
        expect(@client.custom_date_my("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report grouped by date and show tasks" do
        expect(@client.custom_date_my("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report grouped by date and show notes" do
        expect(@client.custom_date_my("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report grouped by date and show archieved" do
        expect(@client.custom_date_my("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report grouped by date and show tasks" do
        expect(@client.custom_date_my("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end
    end

    describe '#custom_member_team' do
      it "returns a custom team report group by member" do
        expect(@client.custom_member_team("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
      end

      it "returns a custom team report group by member and specific organizations" do
        expect(@client.custom_member_team("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by member and specific projects" do
        expect(@client.custom_member_team("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by member and specific users" do
        expect(@client.custom_member_team("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by member and show tasks" do
        expect(@client.custom_member_team("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by member and show notes" do
        expect(@client.custom_member_team("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by member and show archieved" do
        expect(@client.custom_member_team("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by member and show tasks" do
        expect(@client.custom_member_team("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end
    end

    describe '#custom_member_my' do
      it "returns a custom individual report group by member" do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
      end

      it "returns a custom individual report group by member and specific organizations" do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by member and specific projects" do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by member and specific users" do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by member and show tasks" do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by member and show notes" do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by member and show archieved" do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by member and show tasks" do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end
    end

    describe '#custom_project_team' do
      it "returns a custom team report group by project" do
        expect(@client.custom_project_team("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
      end

      it "returns a custom team report group by project and specific organizations" do
        expect(@client.custom_project_team("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by project and specific projects" do
        expect(@client.custom_project_team("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by project and specific users" do
        expect(@client.custom_project_team("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by project and show tasks" do
        expect(@client.custom_project_team("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by project and show notes" do
        expect(@client.custom_project_team("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by project and show archieved" do
        expect(@client.custom_project_team("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom team report group by project and show tasks" do
        expect(@client.custom_project_team("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end
    end

    describe '#custom_project_my' do
      it "returns a custom individual report group by project" do
        expect(@client.custom_project_my("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
      end

      it "returns a custom individual report group by project and specific organizations" do
        expect(@client.custom_project_my("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by project and specific projects" do
        expect(@client.custom_project_my("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by project and specific users" do
        expect(@client.custom_project_my("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by project and show tasks" do
        expect(@client.custom_project_my("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by project and show notes" do
        expect(@client.custom_project_my("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by project and show archieved" do
        expect(@client.custom_project_my("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a custom individual report group by project and show tasks" do
        expect(@client.custom_project_my("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
      end
    end

  end
end
