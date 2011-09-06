class ScribblesController < ApplicationController
  before_filter :authorize

  # GET /scribbles
  # GET /scribbles.xml
  def index
    @scribbles = Scribble.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scribbles }
    end
  end

  # GET /scribbles/1
  # GET /scribbles/1.xml
  def show
    @scribble = Scribble.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scribble }
    end
  end

  # GET /scribbles/new
  # GET /scribbles/new.xml
  def new
    @scribble = Scribble.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scribble }
    end
  end

  # GET /scribbles/1/edit
  def edit
    @scribble = Scribble.find(params[:id])
  end

  # POST /scribbles
  # POST /scribbles.xml
  def create
    @scribble = Scribble.new(params[:scribble])

    respond_to do |format|
      if @scribble.save
        format.html { redirect_to(@scribble, :notice => 'Scribble was successfully created.') }
        format.xml  { render :xml => @scribble, :status => :created, :location => @scribble }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scribble.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scribbles/1
  # PUT /scribbles/1.xml
  def update
    @scribble = Scribble.find(params[:id])

    respond_to do |format|
      if @scribble.update_attributes(params[:scribble])
        format.html { redirect_to(scribbles_path, :notice => 'Scribble was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scribble.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scribbles/1
  # DELETE /scribbles/1.xml
  def destroy
    @scribble = Scribble.find(params[:id])
    @scribble.destroy

    respond_to do |format|
      format.html { redirect_to(scribbles_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def authorize
    unless session['access_token'] && session['access_secret']
      flash[:notice] = 'Please sign in first'
      redirect_to root_path
    end
  end    
end
