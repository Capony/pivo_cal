class Tracker < ActiveRecord::Base
  has_many :projects
  
  validates_presence_of :pivotal_token
  
  def all_projects_from_pivotal
    @projects = []
    @all_projects = pivotal_projects(self)
    
    @all_projects.each do |project|
      unless self.projects.map(&:project_id).include?(project.id)
        @projects << project
      end
    end
    return @projects
  end
  
private

  def pivotal_projects(tracker)
    PivotalTracker::Client.token = tracker.pivotal_token
    PivotalTracker::Project.all
  end
  
end