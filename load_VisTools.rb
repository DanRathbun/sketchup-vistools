#-----------------------------------------------------------------------------
#
# Copyright (c) 2012 Dana Woodman, versions up to 1.1.0
# Copyright (c) 2013 Daniel A. Rathbun, versions 1.2.0+
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#   (1) The above copyright notice and this permission notice shall be
#       included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
#-----------------------------------------------------------------------------
#
# Name        : VisTools
# Based On    : n/a
# Type        : Utility
#
# License     : MIT (See LICENSE file)
# Author      : Dana Woodman
# Email       : <dana@danawoodman.com>
#
# Updates     : Daniel A. Rathbun, Palm Bay, FL, USA
# Website     : https://github.com/DanRathbun/sketchup-vistools
#
# Maintenance : Please log reports for bugs or strange behavior at:
#             : https://github.com/DanRathbun/sketchup-vistools/issues
#
# Version     : 1.3.1
#
# Menu Items  : Plugins -> VisTools -> 
#             :                       Isolate Selected Layers
#             :                       Hide Selected Layers
#             :                       Isolate Selected Entities
#             :                       Hide Selected Entities
#             :                       Freeze Selected Groups and Components
#             :                       Unfreeze All
#             :                       Show All Layers and Entities
#             :                       ----------------------------------
#             :                       Debug
#             :
# Toolbar     : VisTools - Includes one large and one small icon.
#             :
# Context-Menu: VisTools -> 
#             :            Isolate Selected Layers
#             :            Hide Selected Layers
#             :            Isolate Selected Entities
#             :            Hide Selected Entities
#             :            Freeze Selected Groups and Components
#             :            Unfreeze All
#             :            Show All Layers and Entities
#             :
# Description : Trimble SketchUp VisTools provides a few useful tools to help 
#             : you in working with layers and entities within your models.
#             :
# To Install  : Extract the rbz archive into the SketchUp "Plugins" folder.
#-----------------------------------------------------------------------------

#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"  <-- !!!!!!!!!!!!
#

module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    require('sketchup.rb')
    require('extensions.rb')

    # Register plugin as an extension.
    @@plugin = SketchupExtension.new('VisTools', File.join(File.dirname(__FILE__), 'IntrepidBear/VisTools/VisTools.rb'))
    @@plugin.version = '1.3.1'
    @@plugin.creator = 'Dana Woodman (v1.2+ by Daniel A. Rathbun)'
    @@plugin.copyright = '2012, under MIT License'

    @@lang = Sketchup.get_locale()[0,2]

    if @@lang=='en' # English
      @@plugin.description = 'VisTools: Adds some useful visibility tools within SketchUp like Hide/Show entities and layers, Freeze/Unfreeze and Show/Unfreeze all.'
    elsif @@lang=='cs' # Czech
      @@plugin.description = 'VisTools:(Vize-Nástroje) Přidá některé užitečné viditelnost nástroje v rámci SketchUp, jako Skrýt / Oddělit entity a vrstvy, Zmrazit / Uvolnit komponenty a Všechny / Uvolnit vše.'
    elsif @@lang=='de' # German
      @@plugin.description = 'VisTools:(Sicht-Werkzeuge) Fügt einige nützliche Sichtbarkeit Werkzeuge innerhalb von SketchUp wie ein-und Ausblenden Entitäten und Schichten, Einfrieren/Auftauen und Blende/Ausblenden aller.'
    elsif @@lang=='es' # Spanish
      @@plugin.description = 'VisTools:(Herramientas de Visibilidad) Añade algunas herramientas de visibilidad útil dentro de SketchUp como entidades de mostrar u ocultar capas, congelar/descongelar y show/liberar todos.'
    elsif @@lang=='fr' # French
      @@plugin.description = 'VisTools:(Outils de Visibilité) Ajoute des outils de visibilité utile SketchUp, comme Cacher / Montrer les entités et des calques, Geler / Dégeler pour des composants, et Montrer / Dégeler tous.'
    elsif @@lang=='it' # Italian
      @@plugin.description = %q(VisTools:(Strumenti di Visibilità) Aggiunge alcuni strumenti utili visibilità all'interno di SketchUp come Nascondere / Mostrare entità e strati, Congelare / Scongelare e Visualizza / Sblocca tutte le.)
    elsif @@lang=='nl' # Dutch
      @@plugin.description = 'VisTools:(Visie-Werktuigen) Voegt enkele nuttige zichtbaarheid werktuigen binnen SketchUp, zoals Verbergen / Tonen entiteiten en lagen, Bevriezen / Ontdooien componenten, en Toon alle / alle Ontdooien.'
    elsif @@lang=='pl' # Polish
      @@plugin.description = 'VisTools:(Wizja-Narzędzia) Dodaje kilka narzędzi przydatnych widoczność w SketchUp jak Ukryj / Pokaż obiektów i warstw, Zablokuj / Odblokuj i Pokaż / Odblokuj wszystkie.'
    elsif @@lang=='pt' # Portuguese
      @@plugin.description = 'VisTools:(Ferramentas de Visibilidade) Adiciona algumas ferramentas úteis visibilidade dentro SketchUp como Ocultar / Mostrar entidades e camadas, Congelar / Descongelar e Mostrar / Descongelar todos.'
    elsif @@lang=='ru' # Russian
      @@plugin.description = 'VisTools:(Видимость инструменты) Добавляет некоторые полезные видимость инструменты в SketchUp как скрыть / показать сущности и слои, заморозить / разморозить и показать / разморозить все.'
    else # English
      @@plugin.description = 'VisTools: Adds some useful visibility tools within SketchUp like Hide/Show entities and layers, Freeze/Unfreeze and Show/Unfreeze all.'
    end

    Sketchup.register_extension(@@plugin, true)

  end # module VisTools

end # module IntrepidBear

# ... "Look Mom! No code outside the author's namespaces."
