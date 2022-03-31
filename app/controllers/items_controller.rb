class ItemsController < ApplicationController

  def index
  end

  def new
    @prefecture = Prefecture.all
    @commo_deli_day = CommoDeliDay.all
    @commo_st = CommoSt.all
    @commo_cate = CommoCate.all
    @commo_deli_charge = CommoDeliCharge.all
    

  end

end
