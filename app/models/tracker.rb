class Tracker < ActiveRecord::Base
  has_many :projects
  
  def all_projects_from_pivotal
    PivotalTracker::Client.token = self.pivotal_token
    @all_projects = PivotalTracker::Project.all
    
    @projects = []
    @all_projects.each do |project|
      unless self.projects.map(&:project_id).include?(project.id)
        @projects << project
      end
    end
    return @projects
  end
  
end
