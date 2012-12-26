#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  ČEŠTINA / CZECH  ====-- #

      @@menutext = Hash[
        :plugin_name,      "Vize-Nástroje",
        #
        :hide_layers,      "Skrýt Vrstvy",
        :isolate_layers,   "Izolovat Vrstev",
        :hide_entities,    "Skrýt Entit",
        :isolate_entities, "Izolovat Entit",
        :freeze_entities,  "Zmrazit Komponenty",
        :unfreeze_all,     "Uvolnit Všechny",
        :show_all,         "Zobrazit Vše",
        #
        :debug_mode, "Debug Mód"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Skryje vybrané vrstvy",
        :isolate_layers,   "Oddělit vybrané vrstvy",
        :hide_entities,    "Skryje vybrané entity",
        :isolate_entities, "Oddělit vybrané entity",
        :freeze_entities,  "Zmrazení skupiny a komponenty",
        :unfreeze_all,     "Uvolnit všechny",
        :show_all,         "Zobrazit všechny vrstvy a entity"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
