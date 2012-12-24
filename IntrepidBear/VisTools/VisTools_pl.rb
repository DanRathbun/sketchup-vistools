#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  POLSKI / POLISH  ====-- #

      @@menutext = Hash[
        :plugin_name,      "Wizja-Narzędzia",
        #
        :hide_layers,      "Ukryj Warstwy",
        :isolate_layers,   "Izolowanie Warstwy",
        :hide_entities,    "Ukryj Podmioty",
        :isolate_entities, "Izolowanie Podmioty",
        :freeze_entities,  "Zamrożenie Komponenty",
        :unfreeze_all,     "Odmrozić Wszystkie",
        :show_all,         "Pokaż Wszystkie",
        #
        :debug_mode, "Tryb Debug"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Ukryć wybranych warstwy",
        :isolate_layers,   "Izolowanie wybranych warstwy",
        :hide_entities,    "Ukryć wybranych podmioty",
        :isolate_entities, "Izolowanie wybranych podmioty",
        :freeze_entities,  "Zamrożenie Grupy i Komponenty",
        :unfreeze_all,     "Odmrozić wszystko",
        :show_all,         "Pokaż wszystkie warstwy i podmioty"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
