PrototypeRobotics::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  mount Spree::Core::Engine, :at => '/'

end

