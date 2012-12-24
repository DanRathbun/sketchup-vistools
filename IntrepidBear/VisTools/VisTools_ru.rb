#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  РУССКИЙ / RUSSIAN  ====-- #

      @@menutext = Hash[
        :plugin_name,      "Видимость инструменты",
        #
        :hide_layers,      "Скрыть слои",
        :isolate_layers,   "Изолировать слои",
        :hide_entities,    "Скрыть сущностей",
        :isolate_entities, "Изолировать сущностей",
        :freeze_entities,  "Замораживание компонентов",
        :unfreeze_all,     "Разморозить все",
        :show_all,         "Показать все",
        #
        :debug_mode, "Режим отладки"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Скрыть выбранные слои",
        :isolate_layers,   "Изолировать выбранные слои",
        :hide_entities,    "Скрыть выбранные примитивы",
        :isolate_entities, "Изолировать отдельных образований",
        :freeze_entities,  "Заморозить группы и компоненты",
        :unfreeze_all,     "Разблокировать все",
        :show_all,         "Показать все слои и сущностей"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
