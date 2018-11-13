class CountriesController < ApplicationController
  def index
    @q = Country.ransack(params[:q])
    @countries = @q.result(:distinct => true).includes(:addresses).page(params[:page]).per(10)

    render("country_templates/index.html.erb")
  end

  def show
    @address = Address.new
    @country = Country.find(params.fetch("id_to_display"))

    render("country_templates/show.html.erb")
  end

  def new_form
    @country = Country.new

    render("country_templates/new_form.html.erb")
  end

  def create_row
    @country = Country.new

    @country.name = params.fetch("name")
    @country.isocode = params.fetch("isocode")
    @country.continent_code = params.fetch("continent_code")
    @country.flag_image = params.fetch("flag_image") if params.key?("flag_image")

    if @country.valid?
      @country.save

      redirect_back(:fallback_location => "/countries", :notice => "Country created successfully.")
    else
      render("country_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @country = Country.find(params.fetch("prefill_with_id"))

    render("country_templates/edit_form.html.erb")
  end

  def update_row
    @country = Country.find(params.fetch("id_to_modify"))

    @country.name = params.fetch("name")
    @country.isocode = params.fetch("isocode")
    @country.continent_code = params.fetch("continent_code")
    @country.flag_image = params.fetch("flag_image") if params.key?("flag_image")

    if @country.valid?
      @country.save

      redirect_to("/countries/#{@country.id}", :notice => "Country updated successfully.")
    else
      render("country_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @country = Country.find(params.fetch("id_to_remove"))

    @country.destroy

    redirect_to("/countries", :notice => "Country deleted successfully.")
  end
end
