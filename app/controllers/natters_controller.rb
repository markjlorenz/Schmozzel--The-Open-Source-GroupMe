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

  def mobile
    @schmozzeler = Schmozzeler.find_or_create_by_address clean_field(params[:from])
    @schmozzeler.update_attribute :muted_at, nil
    if command_natter params[:text]
      render text:"OK" and return 
    end
    @natter = Natter.new(message:params[:text], schmozzeler_id:@schmozzeler.id, thread:clean_field(params[:to]))
    if @natter.save
      mail = Postoffice.natter(Schmozzeler.listening.all.map(&:address)-[@schmozzeler.address], @natter.message, @schmozzeler, @natter.thread)
      mail.deliver
      render text:"OK"
    else
      mail = Postoffice.natter(@schmozzeler.address)
      mail.deliver
      render text:"NG", :status=>:unprocessable_entity
    end
  end

  def clean_field dirty
    dirty.gsub /\n/, '' unless dirty.nil?
  end

  def command_natter text
    is_command = !(text =~ /^#([^\s]+)/).nil?
    command_key = $1
    if is_command
      command_value = text.gsub /^##{$1}\s/, ''
      command_result = case command_key
        when 'call_me'
          @schmozzeler.rename command_value
          "Hello #{command_value}"
        when "who's_here" then Schmozzeler.all.map(&:name).join(',') 
        when "who's_on_mute" then Schmozzeler.muted.all.map(&:name).join(',') 
        when "all_contacts" then Schmozzeler.all.map(&:address).join("\n") 
        when 'mute'
          @schmozzeler.update_attribute :muted_at, DateTime.now
          "Schmozzel is on mute.  Just start texting again when you want back in."
        when 'help' 
          "call_me - to name yourself\n" +
          "mute - stop the nattering\n" +
          "who's_on_mute - see who's not listening\n" +
          "who's_here - to see the names of the schmozzelers\n" +
          "all_contacts - to see the contact info for all schmozzelers\n"
        else "Sorry, I don\'t know how to '#{command_key}'.  Try, #help"
      end
      mail = Postoffice.natter @schmozzeler.address, command_result
      mail.deliver
    end
    return is_command
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
