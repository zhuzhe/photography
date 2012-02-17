class Admin::ProductionsController < ApplicationController
  # GET /admin/productions
  # GET /admin/productions.xml
  layout 'admin'

  def index
    @admin_productions = Admin::Production.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_productions }
    end
  end

  # GET /admin/productions/1
  # GET /admin/productions/1.xml
  def show
    @admin_production = Admin::Production.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_production }
    end
  end

  # GET /admin/productions/new
  # GET /admin/productions/new.xml
  def new
    @admin_production = Admin::Production.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_production }
    end
  end

  # GET /admin/productions/1/edit
  def edit
    @admin_production = Admin::Production.find(params[:id])
  end

  # POST /admin/productions
  # POST /admin/productions.xml
  def create
    @admin_production = Admin::Production.new(params[:admin_production])
    respond_to do |format|
      if @admin_production.save
        format.html { redirect_to(@admin_production, :notice => 'Production was successfully created.') }
        format.xml  { render :xml => @admin_production, :status => :created, :location => @admin_production }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_production.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/productions/1
  # PUT /admin/productions/1.xml
  def update
    @admin_production = Admin::Production.find(params[:id])
    respond_to do |format|
      if @admin_production.update_attributes(params[:admin_production])
        format.html { redirect_to(@admin_production, :notice => 'Production was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_production.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/productions/1
  # DELETE /admin/productions/1.xml
  def destroy
    @admin_production = Admin::Production.find(params[:id])
    @admin_production.destroy

    respond_to do |format|
      format.html { redirect_to(admin_productions_url) }
      format.xml  { head :ok }
    end
  end
end
