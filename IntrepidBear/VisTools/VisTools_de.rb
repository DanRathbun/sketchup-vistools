#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  DEUTSCH / GERMAN  ====-- #

      @@menutext = Hash[
        :plugin_name,      "Sicht-Werkzeuge",
        #
        :hide_layers,      "Layer Ausblenden",
        :isolate_layers,   "Layer Isolieren",
        :hide_entities,    "Elemente Ausblenden",
        :isolate_entities, "Elemente Isolieren",
        :freeze_entities,  "Komponenten Einfrieren",
        :unfreeze_all,     "Alles Auftauen",
        :show_all,         "Alles Einblenden",
        #
        :debug_mode, "Debug-Modus"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Ausgewählte Layer ausblenden",
        :isolate_layers,   "Ausgewählte Layer isolieren",
        :hide_entities,    "Ausgewählte Elemente ausblenden",
        :isolate_entities, "Ausgewählte Elemente isolieren",
        :freeze_entities,  "Gruppen und Komponenten einfrieren",
        :unfreeze_all,     "Alles auftauen",
        :show_all,         "Blende alle Layer und Elemente ein"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
