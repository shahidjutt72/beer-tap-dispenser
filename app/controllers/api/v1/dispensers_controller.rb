class Api::V1::DispensersController < ApiController
  before_action :set_dispenser, only: %i[show open_tap close_tap]

  def index
    render json: { data: Dispenser.all }, status: :ok
  end  

  def show
    render json: @dispenser, include: :usages, status: :ok
  end

  def open_tap
    if @dispenser.tap_open?
      render json: { error: 'Tap is already open.' }, status: :unprocessable_entity
    else
      @usage = @dispenser.usages.build
      @usage.open_tap

      render json: @usage, status: :created
    end
  end

  def close_tap
    if @dispenser.tap_closed?
      render json: { error: 'Tap is already closed.' }, status: :unprocessable_entity
    else
      @usage = @dispenser.last_usage

      if @usage
        @usage.close_tap

        render json: @usage, status: :ok
      else
        render json: { error: 'No open tap found.' }, status: :unprocessable_entity
      end
    end
  end

  private

  def set_dispenser
    @dispenser = Dispenser.find(params[:id])
  end
end
