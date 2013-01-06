#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  TRADITIONAL CHINESE  ====-- #

      @@menutext = Hash[
        :plugin_name,      "隱藏及顯示工具",
        #
        :hide_layers,      "隱藏圖層",
        :isolate_layers,   "隔離層",
        :hide_entities,    "隱藏實體",
        :isolate_entities, "隔離實體",
        :freeze_entities,  "凍結實體",
        :unfreeze_all,     "全部解凍",
        :show_all,         "全部顯示",
        #
        :debug_mode,       "偵錯模式"
      ]

      @@tooltips = Hash[
        :hide_layers,      "隱藏選定的圖層",
        :isolate_layers,   "分離選定圖層",
        :hide_entities,    "隱藏所選的實體",
        :isolate_entities, "分離選定實體",
        :freeze_entities,  "凍結組和元件",
        :unfreeze_all,     "解凍所有",
        :show_all,         "顯示所有圖層和實體"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
