#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  ENGLISH / ENGLISH  ====-- #

      @@menutext = Hash[
        :plugin_name,      "VisTools",
        #
        :hide_layers,      "Hide Layers",
        :isolate_layers,   "Isolate Layers",
        :hide_entities,    "Hide Entities",
        :isolate_entities, "Isolate Entities",
        :freeze_entities,  "Freeze Groups and Components",
        :unfreeze_all,     "Unfreeze All",
        :show_all,         "Show All",
        #
        :debug_mode, "Debug Mode"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Hide selected layers",
        :isolate_layers,   "Isolate selected layers",
        :hide_entities,    "Hide selected entities",
        :isolate_entities, "Isolate selected entities",
        :freeze_entities,  "Freeze groups and components",
        :unfreeze_all,     "Unfreeze all",
        :show_all,         "Show all layers and entities"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
