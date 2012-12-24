#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  PORTUGUÊS / PORTUGUESE  ====-- #

      @@menutext = Hash[
        :plugin_name,      "Ferramentas de Visibilidade",
        #
        :hide_layers,      "Ocultar Camadas",
        :isolate_layers,   "Isolar Camadas",
        :hide_entities,    "Ocultar Entidades",
        :isolate_entities, "solar a Entidades",
        :freeze_entities,  "Congelar os Componentes",
        :unfreeze_all,     "Descongelar Tudo",
        :show_all,         "Mostrar Tudo",
        #
        :debug_mode, "Modo de depuração"
      ]

      @@tooltips = Hash[
        :hide_layers,      "Ocultar camadas selecionadas",
        :isolate_layers,   "Isolar camadas selecionadas",
        :hide_entities,    "Ocultar entidades selecionadas",
        :isolate_entities, "Isolar entidades selecionadas",
        :freeze_entities,  "Congelar grupos e componentes",
        :unfreeze_all,     "Descongelar tudo",
        :show_all,         "Mostrar todas as camadas e entidades"
      ]

    #
    #}#

  end # module VisTools

end # module IntrepidBear
