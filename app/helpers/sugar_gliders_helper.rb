module SugarGlidersHelper
  def sugar_glider_gender_options
    [
      [ t("activerecord.enums.sugar_glider.gender.male"), "male" ],
      [ t("activerecord.enums.sugar_glider.gender.female"), "female" ]
    ]
  end
end
