class LinkFindersController < ApplicationController
  # GET /link_finders
  # GET /link_finders.json
  def index
    @link_finders = LinkFinder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @link_finders }
    end
  end

  # GET /link_finders/1
  # GET /link_finders/1.json
  def show
    @link_finder = LinkFinder.find(params[:id])
    @page = Pismo::Document.new(@link_finder.url)
    if @link_finder.service_selection == 1
      @link = meetup_ical_find(@link_finder.url)
    elsif @link_finder.service_selection = 2
      @link = 'Evenbrite'
    else
      @link = 'This is an error'
    end
    
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link_finder }
    end
  end

  # GET /link_finders/new
  # GET /link_finders/new.json
  def new
    @link_finder = LinkFinder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link_finder }
    end
  end

  # GET /link_finders/1/edit
  def edit
    @link_finder = LinkFinder.find(params[:id])
  end

  # POST /link_finders
  # POST /link_finders.json
  def create
    @link_finder = LinkFinder.new(params[:link_finder])

    respond_to do |format|
      if @link_finder.save
        format.html { redirect_to @link_finder, notice: 'Link finder was successfully created.' }
        format.json { render json: @link_finder, status: :created, location: @link_finder }
      else
        format.html { render action: "new" }
        format.json { render json: @link_finder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /link_finders/1
  # PUT /link_finders/1.json
  def update
    @link_finder = LinkFinder.find(params[:id])

    respond_to do |format|
      if @link_finder.update_attributes(params[:link_finder])
        format.html { redirect_to @link_finder, notice: 'Link finder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link_finder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_finders/1
  # DELETE /link_finders/1.json
  def destroy
    @link_finder = LinkFinder.find(params[:id])
    @link_finder.destroy

    respond_to do |format|
      format.html { redirect_to link_finders_url }
      format.json { head :no_content }
    end
  end

  #Find the ical link within the document
  def meetup_ical_find(page)
    @download_link = "events/calendar/ical/download.ics"
    @feed = page.to_s

    if @feed.last == '/'
      return @feed + @download_link
    else
      return @feed + '/' + @download_link
    end

    return @work
  end
end














