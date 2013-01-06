#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  KOREAN  ====-- #

      @@menutext = Hash[
        :plugin_name,      "비전 도구",
        #
        :hide_layers,      "레이어 숨기기",
        :isolate_layers,   "분리 레이어",
        :hide_entities,    "엔티티 숨기기",
        :isolate_entities, "엔터티를 분리",
        :freeze_entities,  "고정 그룹 및 구성 요소",
        :unfreeze_all,     "고정 취소 모두",
        :show_all,         "모두 표시",
        #
        :debug_mode,       "디버그 모드"
      ]

      @@tooltips = Hash[
        :hide_layers,      "선택한 레이어 숨기기",
        :isolate_layers,   "선택 된 도면층 분리",
        :hide_entities,    "선택한 엔티티 숨기기",
        :isolate_entities, "선택 된 엔터티가 분리",
        :freeze_entities,  "그룹 및 구성 요소 동결",
        :unfreeze_all,     "모두 고정 취소",
        :show_all,         "모든 레이어 및 엔터티 보기"
      ]
    #
    #}#

  end # module VisTools

end # module IntrepidBear
