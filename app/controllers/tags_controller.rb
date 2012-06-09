class TagsController < ApplicationController
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  # GET /tags/1
  # GET /tags1.xml
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  def rename
    @tag = Tag.find(params[:id])

    # TODO: 
    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to(@tag, :notice => 'Tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end

  end

  # DELETE /tag/1
  # DELETE /tag/1.xml
  def delete
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(tags_url) }
      format.xml  { head :ok }
    end
  end

  # GET /tag/1/rename/name
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:name])
        format.html { redirect_to(@tag, :notice => 'Tag was successfully renamed.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end


  def search
    @tag = Tag.find(params[:name])

    respond_to do |format|
      format.html # search.html.erb
      format.xml  { render :xml => @tags }
    end
  end
end
