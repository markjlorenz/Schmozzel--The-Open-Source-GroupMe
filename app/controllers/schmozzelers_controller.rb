class SchmozzelersController < ApplicationController
  # GET /schmozzelers
  # GET /schmozzelers.xml
  def index
    @schmozzelers = Schmozzeler.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schmozzelers }
    end
  end

  # GET /schmozzelers/1
  # GET /schmozzelers/1.xml
  def show
    @schmozzeler = Schmozzeler.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @schmozzeler }
    end
  end

  # GET /schmozzelers/new
  # GET /schmozzelers/new.xml
  def new
    @schmozzeler = Schmozzeler.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @schmozzeler }
    end
  end

  # GET /schmozzelers/1/edit
  def edit
    @schmozzeler = Schmozzeler.find(params[:id])
  end

  # POST /schmozzelers
  # POST /schmozzelers.xml
  def create
    @schmozzeler = Schmozzeler.new(params[:schmozzeler])

    respond_to do |format|
      if @schmozzeler.save
        format.html { redirect_to(@schmozzeler, :notice => 'Schmozzeler was successfully created.') }
        format.xml  { render :xml => @schmozzeler, :status => :created, :location => @schmozzeler }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @schmozzeler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schmozzelers/1
  # PUT /schmozzelers/1.xml
  def update
    @schmozzeler = Schmozzeler.find(params[:id])

    respond_to do |format|
      if @schmozzeler.update_attributes(params[:schmozzeler])
        format.html { redirect_to(@schmozzeler, :notice => 'Schmozzeler was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @schmozzeler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schmozzelers/1
  # DELETE /schmozzelers/1.xml
  def destroy
    @schmozzeler = Schmozzeler.find(params[:id])
    @schmozzeler.destroy

    respond_to do |format|
      format.html { redirect_to(schmozzelers_url) }
      format.xml  { head :ok }
    end
  end
end
