class VehiclesController < ApplicationController

  load_and_authorize_resource

  def vehicle_type
    params[:type].constantize
  end

  # GET /vehicles
  # GET /vehicles.json
  def index
    
    #Rails.logger.info("------")
    #Rails.logger.info(@cars)
    @vehicles = vehicle_type.all
    
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @vehicles }
    end
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    @vehicle = vehicle_type.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.json
  def new
    @vehicle = vehicle_type.new
    @list_of_properties = Property.all
    
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = vehicle_type.find(params[:id])
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    
    Rails.logger.info("Createben")
    Rails.logger.info(params)
    @vehicle = current_user.vehicles.build(params[:vehicle])
    
      if params[:properties].blank?
        respond_to do |format|
          flash[:error] = 'Params plx.'
          format.html { render action: "new" }
        end
      else
        Property.all.each do |prop|
          # params[:properties][:"#{prop.name}"][:property_id]
          
          if !params[:properties][:"#{prop.name}"][:propvalue].empty?
            @prop = Property.find(params[:properties][:"#{prop.name}"][:property_id].to_i)

            @vehicle.properties << prop
            @vehicle.save!

            @vehicleproperty = @vehicle.vehicleprops.where(:property_id => prop.id).first
            @vehicleproperty.propvalue = params[:properties][:"#{prop.name}"][:propvalue]
            @vehicleproperty.save!

          end
        end


=begin
        params[:propvals].each do |prop|
          Rails.logger.info(prop)

          @pr = prop[0].to_i * prop[1].to_i
          Rails.logger.info("bakker")

          if @pr != 0
            @vehicle.properties << Property.find(prop)
            @vehicle.save!
            @paramval = @vehicle.vehicleprops.where(:property_id => prop).first
            Rails.logger.info("namiez")
            Rails.logger.info(@vehicle.properties)
            Rails.logger.info("erre kellene")
            Rails.logger.info(@paramval)
            @paramval.propvalue = @pr
            @paramval.save!
            Rails.logger.info("namiez")
            Rails.logger.info(@vehicle.properties)
            Rails.logger.info("erre kellene")
            Rails.logger.info(@paramval)
          end
         end
=end

          respond_to do |format|
            if @vehicle.save
              format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
              format.json { render json: @vehicle, status: :created, location: @vehicle }
            else
              format.html { render action: "new" }
              format.json { render json: @vehicle.errors, status: :unprocessable_entity }
            end
          end
        
      end
    
  end

  # PUT /vehicles/1
  # PUT /vehicles/1.json
  def update
    @vehicle = vehicle_type.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle = vehicle_type.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
    end
  end
end
