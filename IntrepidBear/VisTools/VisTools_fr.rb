#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  FRANÇAIS / FRENCH  ====-- #

      @@menutext = Hash[
        :plugin_name,      "Outils de Visibilité",
        #
        :hide_layers,      "Cacher les Calques",
        :isolate_layers,   "Isoler les Calques",
        :hide_entities,    "Cacher les Entités",
        :isolate_entities, "Isoler les Entités",
        :freeze_entities,  "Geler les composants",
        :unfreeze_all,     "Dégeler Tout",
        :show_all,         "Montrer Tout",
        #
        :debug_mode, "Mode Debugage"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Cacher les calques sélectionnés",
        :isolate_layers,   "Isoler les calques sélectionnés",
        :hide_entities,    "Cacher les entités sélectionnées",
        :isolate_entities, "Isoler les entités sélectionnées",
        :freeze_entities,  "Geler groupes et composants",
        :unfreeze_all,     "Dégeler tout",
        :show_all,         "Montrer tous les calques et entités"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
