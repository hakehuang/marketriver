class DataFileController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  def destroy
    @datafile = DataFile.find(params[:id])
    @datafile.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end


end
