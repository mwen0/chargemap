class AddressesController < ApplicationController
  def index
    @addresses = Address.all

    render("address_templates/index.html.erb")
  end

  def show
    @address = Address.find(params.fetch("id_to_display"))

    render("address_templates/show.html.erb")
  end

  def new_form
    @address = Address.new

    render("address_templates/new_form.html.erb")
  end

  def create_row
    @address = Address.new

    @address.latitude = params.fetch("latitude")
    @address.longitude = params.fetch("longitude")
    @address.name = params.fetch("name")
    @address.address_line1 = params.fetch("address_line1")
    @address.address_line2 = params.fetch("address_line2")
    @address.town = params.fetch("town")
    @address.post_code = params.fetch("post_code")
    @address.state_or_province = params.fetch("state_or_province")
    @address.has_ev_parking_places = params.fetch("has_ev_parking_places")
    @address.country_id = params.fetch("country_id")

    if @address.valid?
      @address.save

      redirect_back(:fallback_location => "/addresses", :notice => "Address created successfully.")
    else
      render("address_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @address = Address.find(params.fetch("prefill_with_id"))

    render("address_templates/edit_form.html.erb")
  end

  def update_row
    @address = Address.find(params.fetch("id_to_modify"))

    @address.latitude = params.fetch("latitude")
    @address.longitude = params.fetch("longitude")
    @address.name = params.fetch("name")
    @address.address_line1 = params.fetch("address_line1")
    @address.address_line2 = params.fetch("address_line2")
    @address.town = params.fetch("town")
    @address.post_code = params.fetch("post_code")
    @address.state_or_province = params.fetch("state_or_province")
    @address.has_ev_parking_places = params.fetch("has_ev_parking_places")
    @address.country_id = params.fetch("country_id")

    if @address.valid?
      @address.save

      redirect_to("/addresses/#{@address.id}", :notice => "Address updated successfully.")
    else
      render("address_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @address = Address.find(params.fetch("id_to_remove"))

    @address.destroy

    redirect_to("/addresses", :notice => "Address deleted successfully.")
  end
end
