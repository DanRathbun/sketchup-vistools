#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  NEDERLANDS / DUTCH  ====-- #

      @@menutext = Hash[
        :plugin_name,      "Visie-Werktuigen",
        #
        :hide_layers,      "Lagen Verbergen",
        :isolate_layers,   "Isoleren van Lagen",
        :hide_entities,    "Entiteiten Verbergen",
        :isolate_entities, "Entiteiten Isoleren",
        :freeze_entities,  "Bevriezen van Componenten",
        :unfreeze_all,     "Alle Ontdooien",
        :show_all,         "Toon Alle",
        #
        :debug_mode, "Debug Modus"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Geselecteerde lagen verbergen",
        :isolate_layers,   "Geselecteerde lagen isoleren",
        :hide_entities,    "Geselecteerde entiteiten verbergen",
        :isolate_entities, "Geselecteerde entiteiten isoleren",
        :freeze_entities,  "Bevriezen van groepen en componenten",
        :unfreeze_all,     "Alle ontdooien",
        :show_all,         "Toon alle lagen en entiteiten"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
