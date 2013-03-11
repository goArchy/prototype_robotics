class ProjectNotifier < ActionMailer::Base
  default :from => "admin@prototyperobotics.com"

  def admin(project_id)
    @project = Project.find(project_id)
    @user = @project.user
    @url = project_url(@project)
    @to = User.select{|s| s.admin == true }.map(&:email)
    mail(:to => @to, :subject => "PrototypeRobotics: user #{@user.username} just created project: #{@project.name}.")
  end

end
