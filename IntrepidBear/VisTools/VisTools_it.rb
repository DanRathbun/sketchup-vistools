#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  ITALIANO / ITALIAN  ====-- #

      @@menutext = Hash[
        :plugin_name,      "Strumenti di Visibilità",
        #
        :hide_layers,      "Nascondi livelli",
        :isolate_layers,   "Isolare i livelli",
        :hide_entities,    "Nascondi entità",
        :isolate_entities, "Isolare i soggetti",
        :freeze_entities,  "Congelare i componenti",
        :unfreeze_all,     "Sblocca tutti i",
        :show_all,         "Visualizza tutti i",
        #
        :debug_mode, "Modalità di debug"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Nascondere i livelli selezionati",
        :isolate_layers,   "Isolare i livelli selezionati",
        :hide_entities,    "Nascondi entità selezionate",
        :isolate_entities, "Isolare le entità selezionate",
        :freeze_entities,  "Congelare gruppi e componenti",
        :unfreeze_all,     "Sblocca tutti i",
        :show_all,         "Visualizza tutti i livelli e le entità"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
