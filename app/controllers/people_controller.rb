class PeopleController < ApplicationController
  def index
    @people = Person.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@people.where.not(:address_latitude => nil)) do |person, marker|
      marker.lat person.address_latitude
      marker.lng person.address_longitude
      marker.infowindow "<h5><a href='/people/#{person.id}'>#{person.family_name}</a></h5><small>#{person.address_formatted_address}</small>"
    end

    render("person_templates/index.html.erb")
  end

  def show
    @person = Person.find(params.fetch("id_to_display"))

    render("person_templates/show.html.erb")
  end

  def new_form
    @person = Person.new

    render("person_templates/new_form.html.erb")
  end

  def create_row
    @person = Person.new

    @person.family_name = params.fetch("family_name")
    @person.first_name = params.fetch("first_name")
    @person.gender = params.fetch("gender")
    @person.birth_date = params.fetch("birth_date")
    @person.phone_number1 = params.fetch("phone_number1")
    @person.phone_number2 = params.fetch("phone_number2")
    @person.website = params.fetch("website")
    @person.address_id = params.fetch("address_id")
    @person.address = params.fetch("address")

    if @person.valid?
      @person.save

      redirect_back(:fallback_location => "/people", :notice => "Person created successfully.")
    else
      render("person_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @person = Person.find(params.fetch("prefill_with_id"))

    render("person_templates/edit_form.html.erb")
  end

  def update_row
    @person = Person.find(params.fetch("id_to_modify"))

    @person.family_name = params.fetch("family_name")
    @person.first_name = params.fetch("first_name")
    @person.gender = params.fetch("gender")
    @person.birth_date = params.fetch("birth_date")
    @person.phone_number1 = params.fetch("phone_number1")
    @person.phone_number2 = params.fetch("phone_number2")
    @person.website = params.fetch("website")
    @person.address_id = params.fetch("address_id")
    @person.address = params.fetch("address")

    if @person.valid?
      @person.save

      redirect_to("/people/#{@person.id}", :notice => "Person updated successfully.")
    else
      render("person_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @person = Person.find(params.fetch("id_to_remove"))

    @person.destroy

    redirect_to("/people", :notice => "Person deleted successfully.")
  end
end
