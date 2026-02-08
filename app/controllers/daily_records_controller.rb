class DailyRecordsController < ApplicationController
  before_action :require_sugar_glider

  def new
    @daily_record = @sugar_glider.daily_records.build(record_date: Date.current)
  end

  def create
    @daily_record = @sugar_glider.daily_records.build(daily_record_params)

    if @daily_record.save
      redirect_to new_daily_record_path, success: t("daily_records.new.success")
    else
      flash.now[:alert] = t("daily_records.new.failure")
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @daily_records = @sugar_glider.daily_records.order(record_date: :desc)

    # チェックされた検索条件のみ絞り込みを追加
    @daily_records = @daily_records.with_food_attention if params[:food_attention] == "1"
    @daily_records = @daily_records.with_excretion_attention if params[:excretion_attention] == "1"
    @daily_records = @daily_records.with_abnormal_attention if params[:abnormal_attention] == "1"
  end

  private

  # マイモモンガが登録されていない場合、マイモモンガの新規登録ページに遷移する
  def require_sugar_glider
    @sugar_glider = current_user.sugar_glider
    return if @sugar_glider.present?

    redirect_to new_sugar_glider_path, alert: t("daily_records.new.need_sugar_glider")
  end

  def daily_record_params
    params.require(:daily_record).permit(
      :record_date,
      :cage_temperature,
      :cage_humidity,
      :activity_hours,
      :food_amount,
      :snack_amount,
      :water_amount,
      :pee_amount,
      :pee_color,
      :poop_amount,
      :poop_shape,
      :night_crying,
      :hair_loss,
      :ear_dryness,
      :self_injury,
      :memo
    )
  end
end
