#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
#  THANKS GO TO: XIAOLONG (guanjin)
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  SIMPLIFIED CHINESE  ====-- #

      @@menutext = Hash[
        :plugin_name,      "隐藏显示工具",
        #
        :hide_layers,      "隐藏图层",
        :isolate_layers,   "分离图层",
        :hide_entities,    "隐藏实体",
        :isolate_entities, "分离实体",
        :freeze_entities,  "锁定组件",
        :unfreeze_all,     "解锁所有",
        :show_all,         "显示全部",
        #
        :debug_mode, "调试模式"
      ]

      @@tooltips = Hash[
        :hide_layers,      "隐藏图层",
        :isolate_layers,   "分离所选的图层",
        :hide_entities,    "隐藏选定的实体",
        :isolate_entities, "分离所选实体",
        :freeze_entities,  "锁定群组组件",
        :unfreeze_all,     "解锁所有操作",
        :show_all,         "显示所有的图层和实体"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
