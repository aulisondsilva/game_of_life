class LifeController < ApplicationController
  before_action :init, only: [:index, :start, :clear]

  def index
    set_params
    @@life = Life.new(@cols, @rows)
  end

  def start
    set_params
    cells = []
    if params[:load] == 'true'
      params[:cells].to_hash.values.each do |col, row|
        cells.push([col.to_i, row.to_i])
      end
      @@life.load cells
    end
    @grid = @@life.execute
  end

  def clear
    @@life = Life.new(@cols, @rows)
  end

  private
  def set_params
    @cols = params[:cols].to_i > 50 ? 50 : params[:cols].to_i if !params[:cols].nil?
    @rows = params[:rows].to_i > 50 ? 50 : params[:rows].to_i if !params[:rows].nil?
    @box_size = box_size
  end

  def init
    @rows = 20
    @cols = 20
    @box_size = box_size
  end
end
