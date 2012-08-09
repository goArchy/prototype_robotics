PrototypeRobotics::Application.routes.draw do

#  mount Forem::Engine, :at => "/forums"
  mount Ckeditor::Engine => '/ckeditor'
  mount Spree::Core::Engine, :at => '/'

end

