class ItemsController < ApplicationController

  def index
    @commos = Commo.includes(:user)
  end

  def new
    @prefecture = Prefecture.all
    @commo_deli_day = CommoDeliDay.all
    @commo_st = CommoSt.all
    @commo_cate = CommoCate.all
    @commo_deli_charge = CommoDeliCharge.all
    @commo = Commo.new
  end

  def create
    @commo = Commo.new(commo_params)

    if @commo.save
      redirect_to root_path(@commo)
    else
      render :new
    end
  
  end

  private




end
