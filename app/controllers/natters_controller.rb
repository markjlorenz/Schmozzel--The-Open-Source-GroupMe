class NattersController < ApplicationController
  skip_before_filter :verify_authenticity_token, only:[:natters_mobile]

  def index
    @natters = Natter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @natters }
    end
  end

  def show
    @natter = Natter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @natter }
    end
  end

  def new
    @natter = Natter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @natter }
    end
  end

  def edit
    @natter = Natter.find(params[:id])
  end

  def create
    @natter = Natter.new(params[:natter])

    respond_to do |format|
      if @natter.save
        format.html { redirect_to(@natter, :notice => 'Natter was successfully created.') }
        format.xml  { render :xml => @natter, :status => :created, :location => @natter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @natter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def natters_mobile
  end

  def update
    @natter = Natter.find(params[:id])

    respond_to do |format|
      if @natter.update_attributes(params[:natter])
        format.html { redirect_to(@natter, :notice => 'Natter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @natter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @natter = Natter.find(params[:id])
    @natter.destroy

    respond_to do |format|
      format.html { redirect_to(natters_url) }
      format.xml  { head :ok }
    end
  end
end
