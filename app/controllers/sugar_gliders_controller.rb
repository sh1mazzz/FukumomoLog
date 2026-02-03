class SugarGlidersController < ApplicationController
  before_action :require_sugar_glider, only: %i[edit update]

  def new
    @sugar_glider = current_user.build_sugar_glider
  end

  def create
    @sugar_glider = current_user.build_sugar_glider(sugar_glider_params)

    if @sugar_glider.save
      redirect_to edit_sugar_glider_path, notice: "マイモモンガを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  private

  # 既にマイモモンガが登録済かを確認し、未登録なら新規登録画面へリダイレクトする
  def require_sugar_glider
    @sugar_glider = current_user.sugar_glider
    return if @sugar_glider.present?

    redirect_to new_sugar_glider_path
  end

  def sugar_glider_params
    params.require(:sugar_glider).permit(:name, :gender, :birthday, :weight)
  end
end
