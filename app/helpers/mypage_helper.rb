module MypageHelper
  # マイモモンガが登録されている場合、今日の記録・記録一覧のボタンを有効化
  def can_use_records?
    current_user&.sugar_glider.present?
  end
end
