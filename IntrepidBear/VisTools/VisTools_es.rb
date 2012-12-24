#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  ESPAÑOL / SPANISH  ====-- #

      @@menutext = Hash[
        :plugin_name,      "Herramientas de Visibilidad",
        #
        :hide_layers,      "Ocultar Capas",
        :isolate_layers,   "Aislar Capas",
        :hide_entities,    "Ocultar Entidades",
        :isolate_entities, "Aislar Entidades",
        :freeze_entities,  "Congelar Componentes",
        :unfreeze_all,     "Descongelar Todo",
        :show_all,         "Mostrar Todo",
        #
        :debug_mode, "Modo de Depuración"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Ocultar Capas Seleccionadas",
        :isolate_layers,   "Aislar Capas Seleccionadas",
        :hide_entities,    "Ocultar Entidades Seleccionadas",
        :isolate_entities, "Aislar Entidades Seleccionadas",
        :freeze_entities,  "Congelar Grupos/Componentes",
        :unfreeze_all,     "Descongelar Todo",
        :show_all,         "Mostrar Todas las Capas y Entidades"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
