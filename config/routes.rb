Rails.application.routes.draw do
  # Routes for the Country resource:

  # CREATE
  get("/countries/new", { :controller => "countries", :action => "new_form" })
  post("/create_country", { :controller => "countries", :action => "create_row" })

  # READ
  get("/countries", { :controller => "countries", :action => "index" })
  get("/countries/:id_to_display", { :controller => "countries", :action => "show" })

  # UPDATE
  get("/countries/:prefill_with_id/edit", { :controller => "countries", :action => "edit_form" })
  post("/update_country/:id_to_modify", { :controller => "countries", :action => "update_row" })

  # DELETE
  get("/delete_country/:id_to_remove", { :controller => "countries", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Person resource:

  # CREATE
  get("/people/new", { :controller => "people", :action => "new_form" })
  post("/create_person", { :controller => "people", :action => "create_row" })

  # READ
  get("/people", { :controller => "people", :action => "index" })
  get("/people/:id_to_display", { :controller => "people", :action => "show" })

  # UPDATE
  get("/people/:prefill_with_id/edit", { :controller => "people", :action => "edit_form" })
  post("/update_person/:id_to_modify", { :controller => "people", :action => "update_row" })

  # DELETE
  get("/delete_person/:id_to_remove", { :controller => "people", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
