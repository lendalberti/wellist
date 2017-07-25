class ApiController < ApplicationController
  require "uri"
  require "net/http"


  
  # add vendor to wellist
  def create
    status_code = ''
    success = 200
    failure = 500
    message = ''

    pDebug("Create; params=[#{params.inspect}]")

    w = Wellist.new
    w.user_id   = params['user_id']
    w.vendor_id = params['vendor_id']

    if Wellist.where(user_id: params['user_id']).where(vendor_id: params['vendor_id']).count == 0
      if w.save
        pDebug("Adding vendor: [#{w.inspect}]")
        status_code = success
      else
        pDebug("Can't add vendor to wellist: [#{w.inspect}], error: #{w.errors.messages}")
        status_code = failure
        message = w.errors.messages
      end
    else
      status_code = failure
      message = 'vendor alread added'
    end

    render :json => { :status_code => status_code, :msg => message }

  end
  
  # make list or vendor public or private
  def update
    status_code = ''
    success = 200
    failure = 500
    message = ''

    if params['list'].present? && params['list']=='true' && params['user'].present?
      item = params['list'] ? 'list' : 'vendor'
      user = User.find(params['user'])

      wellists = Wellist.where( user_id: user.id )
      wellists.each do |w|
        w.public_list = w.public_list == true ? false : true
        if w.save
          pDebug("Saving: [#{w.inspect}]")
          status_code = success
        else
          pDebug("Can't update wellist: [#{w.inspect}], error: #{w.errors.messages}")
          status_code = failure
          message = w.errors.messages
        end
      end
    else
      wellist_id = params['item_id'] 
      w = Wellist.find( wellist_id )
      w.public_vendor = w.public_vendor == true ? false : true
      if w.save
        pDebug("Saving: [#{w.inspect}]")
        status_code = success
      else
        pDebug("Can't update wellist: [#{w.inspect}], error: #{w.errors.messages}")
        status_code = failure
        message = w.errors.messages
      end
    end

    render :json => { :status_code => status_code, :msg => message }

  end


  # remove vendor
  def destroy
    if params['wellist_id'].present?
      Wellist.find(params['wellist_id']).destroy
    end

    render :json => { :status_code => 200, :msg => 'vendor deleted from wellist' }

  end




  


end
