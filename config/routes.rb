Rails.application.routes.draw do
 root 'attendance#index'
 post '/attendances/time_in_out', to: 'attendance#time_in_out'
 get '/admin/attendance', to: 'admin#record'
 get '/admin/view/:id', to: 'admin#view'
 post '/admin/addstudent', to: "admin#addstudentfunction"
 get '/admin/add', to: 'admin#addform'
 get '/delete/student/:id', to: 'admin#deletestudent'
 get '/allrecords', to: 'admin#attendancerecord'
 get '/admin/search', to: 'admin#search'
 get '/admin/login', to: 'admin#login'
 post '/admin/acc', to: 'admin#adminacc'

 get '/students/edit/:id', to: 'admin#edit'
 post '/students/update/:id', to: 'admin#update'

 get '/logout', to: 'admin#logout'
 



end
