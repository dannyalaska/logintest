class Rule < ActiveRecord::Base
  require 'NetAddr'

  belongs_to :user

  def cidr_address
    cidr = NetAddr::CIDR.create('192.168.1.1/24')
  end

  def ip_address
    @ip = request.remote_ip
  end
end
