#-----------------------------------------------------------------------------
#
# Copyright 2012 Dana Woodman <dana@danawoodman.com>. All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software for
# any purpose and without fee is hereby granted, provided the above
# copyright notice appear in all copies.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
#-----------------------------------------------------------------------------
# 
# Please see the README.md file for help and instructions.
#
#-----------------------------------------------------------------------------
# VERSIONS:
#
#   1.0.1 : 2012-10-03 : Dana Woodman (ishboo)
#   * Note: Documentation Heading in extension registration script says v1.1
#
#   1.2.0 : 2012-12-22 : Daniel A. Rathbun, Palm Bay, FL, USA
#         + multi-language support
#         + multi-model support
#
#   1.2.1 : 2012-12-25 : Daniel A. Rathbun, Palm Bay, FL, USA
#         + Dutch & Czech language support.
#         ~ Revised lang file load error notice.
#         ~ Gray-out commands that rely upon selection, when it is empty.
#         + Add UI disable during undo operations for SketchUp versions 7+.
#         ~ Prevent unnecessary undo operations when nothing to be done.
#         ~ Fixed: Undo operation names were not localized.
#         ~ Fixed: unfreeze_all() and show_all() method descriptions.
#
#-----------------------------------------------------------------------------

module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    # MODULE CONSTANTS
    BASEPATH = File.dirname(__FILE__) unless defined?(BASEPATH)
    VERSION  = @@plugin.version unless defined?(VERSION)

    #{# MODULE VARIABLES
    #
      @@debug = false unless defined?(@@debug)
      @@debug_state = MF_UNCHECKED unless defined?(@@debug_state)
      @@toolbar = nil unless defined?(@@toolbar)
      @@submenu = nil unless defined?(@@submenu)
      @@command = {}  unless defined?(@@command)
      
      @@select_proc = Proc.new {
        Sketchup.active_model.selection.empty? ? MF_GRAYED : MF_ENABLED
      }

      #{ Load localized string hashes from file:
      @@lang = Sketchup.get_locale()[0,2] unless defined?(@@lang)
      begin
        if @@lang == 'en'
          raise(LoadError,"English")
        else
          load(File.join(BASEPATH,"VisTools_"<<@@lang<<".rb"))
        end
      rescue LoadError => e
        if e.message != 'English' && !$VERBOSE.nil?
          puts()
          puts('NOTICE: Could not find a "VisTools_'<<@@lang<<'.rb" file to load.')
          puts('Using English text for VisTools plugin UI.')
          puts()
        end
        @@menutext = Hash[
          :plugin_name,      "VisTools",
          #
          :hide_layers,      "Hide Layers",
          :isolate_layers,   "Isolate Layers",
          :hide_entities,    "Hide Entities",
          :isolate_entities, "Isolate Entities",
          :freeze_entities,  "Freeze Groups/Components",
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
      end #}
    #
    #}#


    class << self # <--<< THIS module's anonymous singleton proxy class


      #{ debug( arg )
      #  debug=( arg )
      #
      #  If arg is a Numeric, any value greater than 0 is true. Otherwise
      #  sets the module's debug flag to the boolean evaluation of arg.
      #  If called with no argument, debug is set false.
      #
      def debug(arg=false)
        if arg.is_a?(Numeric)
          @@debug =( arg>0 ? true : false )
        else
          @@debug =( arg ? true : false )
        end
        @@debug_state =( @@debug ? MF_CHECKED : MF_UNCHECKED )
      end
      def debug=(arg) # alias
        debug(arg)
      end
      #} debug()


      #{ debug?
      #
      #  Returns boolean state of the debug flag.
      #
      def debug?()
        return @@debug
      end
      #} debug?()


      #{ isolate_layers()
      #
      #  Isolate selected layers.
      #  Hide all layers that are not within the selection.
      #
      def isolate_layers
        unless Sketchup.active_model.selection.empty?
          selection_layers = Sketchup.active_model.selection.collect {|s| s.layer }
          layers_to_hide = Sketchup.active_model.layers.to_a - selection_layers
          layers_to_hide = layers_to_hide - [Sketchup.active_model.active_layer]
          unless layers_to_hide.empty?
            puts("Isolating #{selection_layers.length} layers...") if @@debug
            begin
              #
              if Sketchup.version.to_i > 6 # disable UI during operation
                Sketchup.active_model.start_operation(@@menutext[:isolate_layers],!@@debug)
              else
                Sketchup.active_model.start_operation(@@menutext[:isolate_layers])
              end
                #
                layers_to_hide.each {|l|
                  puts("Making layer '#{l}' hidden...") if @@debug
                  l.visible = false unless l == Sketchup.active_model.active_layer 
                }
                #
              Sketchup.active_model.commit_operation
              #
            rescue Exception => e
              #
              unless $VERBOSE.nil? # not in silent mode
                puts("\nVisTools 'isolate_layers' Error encountered: #{e.class.name}")
                puts("\t#{e.message}") if @@debug
                puts(e.backtrace) if @@debug && $VERBOSE
                puts()
              end
              Sketchup.active_model.abort_operation
              #
            end
          else
            puts("No layers can be hidden.") if @@debug
          end
        else
          puts("Nothing selected!!!") if @@debug
        end
      end #} isolate_layers()

      
      #{ hide_layers()
      #
      #  Hide selected layers.
      #  Grabs all layers in selection and turns their visibility off.
      #
      def hide_layers
        unless Sketchup.active_model.selection.empty?
          selection_layers = Sketchup.active_model.selection.collect {|s| s.layer }
          layers_to_hide = selection_layers - [Sketchup.active_model.active_layer]
          unless layers_to_hide.empty?
            puts("Hiding #{layers_to_hide.length} layers...") if @@debug
            begin
              #
              if Sketchup.version.to_i > 6 # disable UI during operation
                Sketchup.active_model.start_operation(@@menutext[:hide_layers],!@@debug)
              else
                Sketchup.active_model.start_operation(@@menutext[:hide_layers])
              end
                #
                layers_to_hide.each {|l|
                  puts("Making layer '#{l}' hidden...") if @@debug
                  l.visible = false unless l == Sketchup.active_model.active_layer
                }
                #
              Sketchup.active_model.commit_operation
              #
            rescue Exception => e
              #
              unless $VERBOSE.nil? # not in silent mode
                puts("\nVisTools 'hide_layers' Error encountered: #{e.class.name}")
                puts("\t#{e.message}") if @@debug
                puts(e.backtrace) if @@debug && $VERBOSE
                puts()
              end
              Sketchup.active_model.abort_operation
              #
            end
          else
            puts("No layers can be hidden.") if @@debug
          end
        else
          puts("Nothing selected!!!") if @@debug
        end
      end #} hide_layers()


      #{ isolate_entities()
      #
      #  Isolate selected entities.
      #  Hides all entities other than the selected entity.
      #
      def isolate_entities
        unless Sketchup.active_model.selection.empty?
          ents_to_hide = Sketchup.active_model.entities.to_a - Sketchup.active_model.selection.to_a
          unless ents_to_hide.empty?
            puts("Isolating #{ents_to_hide.length} entities...") if @@debug
            begin
              #
              if Sketchup.version.to_i > 6 # disable UI during operation
                Sketchup.active_model.start_operation(@@menutext[:isolate_entities],!@@debug)
              else
                Sketchup.active_model.start_operation(@@menutext[:isolate_entities])
              end
                #
                ents_to_hide.each {|e|
                  puts( "Making '#{e}' entity hidden...") if @@debug
                  e.visible = false
                }
                #
              Sketchup.active_model.commit_operation
              #
            rescue Exception => e
              #
              unless $VERBOSE.nil? # not in silent mode
                puts("\nVisTools 'isolate_entities' Error encountered: #{e.class.name}")
                puts("\t#{e.message}") if @@debug
                puts(e.backtrace) if @@debug && $VERBOSE
                puts()
              end
              Sketchup.active_model.abort_operation
              #
            end
          else
            puts("No entities can be hidden.") if @@debug
          end
        else
          puts("Nothing selected!!!") if @@debug
        end
      end #} isolate_entities()


      #{ hide_entities()
      #
      #  Hide selected entities.
      #  Hide all entities within the selection.
      #
      def hide_entities
        unless Sketchup.active_model.selection.empty?
          #
          ents_to_hide = Sketchup.active_model.selection.find_all {|e| e.visible? }
          unless ents_to_hide.empty?
            begin
              #
              if Sketchup.version.to_i > 6 # disable UI during operation
                Sketchup.active_model.start_operation(@@menutext[:hide_entities],!@@debug)
              else
                Sketchup.active_model.start_operation(@@menutext[:hide_entities])
              end
                #
                ents_to_hide.each {|e|
                  puts("Making '#{e}' entity hidden...") if @@debug
                  e.visible = false
                }
                #
              Sketchup.active_model.commit_operation
              #
            rescue Exception => e
              #
              unless $VERBOSE.nil? # not in silent mode
                puts("\nVisTools 'hide_entities' Error encountered: #{e.class.name}")
                puts("\t#{e.message}") if @@debug
                puts(e.backtrace) if @@debug && $VERBOSE
                puts()
              end
              Sketchup.active_model.abort_operation
              #
            end
          else
            puts("No entities can be hidden.") if @@debug
          end
        else
          puts("Nothing selected!!!") if @@debug
        end
      end #} hide_entities()
    

      #{ freeze_groups_and_components()
      #
      #  Freeze selected entities.
      #  Hides and locks all groups and components within the selection. 
      #  Since lock only works on groups or components, this tool will only work 
      #  on groups and components.
      #
      def freeze_groups_and_components
        unless Sketchup.active_model.selection.empty?
          if Sketchup.active_model.selection.find {|e| e.is_a?(Sketchup::Group) or e.is_a?(Sketchup::ComponentInstance)}
            puts("Freezing selection...") if @@debug
            begin
              #
              if Sketchup.version.to_i > 6 # disable UI during operation
                Sketchup.active_model.start_operation(@@menutext[:freeze_entities],!@@debug)
              else
                Sketchup.active_model.start_operation(@@menutext[:freeze_entities])
              end
                #
                Sketchup.active_model.selection.each {|e| 
                  if e.is_a?(Sketchup::Group) or e.is_a?(Sketchup::ComponentInstance)
                    puts("Making '#{e}' entity hidden and locked...") if @@debug
                    e.visible = false
                    e.locked = true
                  end
                }
                #
              Sketchup.active_model.commit_operation
              #
            rescue Exception => e
              #
              unless $VERBOSE.nil? # not in silent mode
                puts("\nVisTools 'freeze_groups_and_components' Error encountered: #{e.class.name}")
                puts("\t#{e.message}") if @@debug
                puts(e.backtrace) if @@debug && $VERBOSE
                puts()
              end
              Sketchup.active_model.abort_operation
              #
            end
          else
            puts("Selection has no groups nor components.") if @@debug
          end # if the selection has a group or component
        else
          puts("Nothing selected!!!") if @@debug
        end
      end #} freeze_groups_and_components()
    

      #{ unfreeze_all()
      #
      #  Unfreeze all groups and components.
      #  Shows and unlocks all groups and components. 
      #  Since lock only works on groups or components, this tool will only work 
      #  on groups and components.
      #
      def unfreeze_all
        if Sketchup.active_model.entities.find {|e| e.is_a?(Sketchup::Group) or e.is_a?(Sketchup::ComponentInstance)}
          puts("Unfreezing everything...") if @@debug
          begin
            #
            if Sketchup.version.to_i > 6 # disable UI during operation
              Sketchup.active_model.start_operation(@@menutext[:unfreeze_all],!@@debug)
            else
              Sketchup.active_model.start_operation(@@menutext[:unfreeze_all])
            end
              #
              Sketchup.active_model.entities.each {|e| 
                if e.is_a?(Sketchup::Group) or e.is_a?(Sketchup::ComponentInstance)
                  if e.locked? and not e.visible?
                    puts("Making '#{e}' entity visible and unlocked...") if @@debug
                    e.locked = false
                    e.visible = true
                  end
                end
              }
              #
            Sketchup.active_model.commit_operation
            #
          rescue Exception => e
            #
            unless $VERBOSE.nil? # not in silent mode
              puts("\nVisTools 'unfreeze_all' Error encountered: #{e.class.name}")
              puts("\t#{e.message}") if @@debug
              puts(e.backtrace) if @@debug && $VERBOSE
              puts()
            end
            Sketchup.active_model.abort_operation
            #
          end
        else
          puts("Model has no groups nor components.") if @@debug
        end # if model's entities have a group or component
      end #} unfreeze_all()


      #{ show_all()
      #
      #  Show all
      #  Unhides all hidden layers and entities.
      #  If a group or component is both locked and hidden, 
      #   assume it is frozen, so do not thaw it.
      #
      def show_all
        begin
          #
          if Sketchup.version.to_i > 6 # disable UI during operation
            Sketchup.active_model.start_operation(@@menutext[:show_all],!@@debug)
          else
            Sketchup.active_model.start_operation(@@menutext[:show_all])
          end
            #
            layers_to_show = Sketchup.active_model.layers.find_all {|l| l.visible? == false }
            unless layers_to_show.empty?
              puts("Showing all layers... Making #{layers_to_show.length} visible...") if @@debug
              layers_to_show.each {|l|
                puts("\tMaking '#{l.name}' layer '#{l}' visible...") if @@debug
                l.visible = true
              }
            else
              puts("No hidden layers to make visible...") if @@debug
            end
            #
            ents_to_show = Sketchup.active_model.entities.find_all {|e| e.visible? == false }
            unless ents_to_show.empty?
              puts("Showing all entities...") if @@debug
              ents_to_show.each {|e|
                unless e.visible?
                  # If the entity is a Group or Component, test if it is frozen.
                  if e.is_a?(Sketchup::Group) or e.is_a?(Sketchup::ComponentInstance)
                    if not e.visible? and e.locked?
                      puts("\t'#{e}' is hidden and locked, do not show it...") if @@debug
                    else
                      puts("\tMaking '#{e}' entity visible...") if @@debug
                      e.visible = true
                    end
                  else
                    puts("\tMaking '#{e}' entity visible...") if @@debug
                    e.visible = true
                  end
                end # if the entity is hidden
              }
            else
              puts("No entities to make visible...") if @@debug
            end
            #
          Sketchup.active_model.commit_operation
          #
        rescue Exception => e
          #
          unless $VERBOSE.nil? # not in silent mode
            puts("\nVisTools 'show_all' Error encountered: #{e.class.name}")
            puts("\t#{e.message}") if @@debug
            puts(e.backtrace) if @@debug && $VERBOSE
            puts()
          end
          Sketchup.active_model.abort_operation
          #
        end
      end #} show_all()


    end # proxy class

    # ------------------------------------------------------------------------------
    # UI features
    # ------------------------------------------------------------------------------
    #{
    # Create the commands for the plugin, create and show the toolbar, context 
    # menus and the menu items for the tools.
    #
    # Only create commands if this file is not already loaded:
    if not file_loaded?(File.join(BASEPATH, "VisTools.rb"))

      # ----------------------------------------------------------------------------
      # Create the various Utility commands
      # ----------------------------------------------------------------------------

      #{ Create the hide_layers command.
      #
      cmd = @@command[:hide_layers]= UI::Command.new("Hide Layers") { 
        hide_layers()
      }
      cmd.small_icon = File.join(BASEPATH, "images/hide_layers_small.png")
      cmd.large_icon = File.join(BASEPATH, "images/hide_layers_large.png")
      cmd.menu_text = @@menutext[:hide_layers]
      cmd.status_bar_text = cmd.tooltip = @@tooltips[:hide_layers]
      cmd.set_validation_proc(&@@select_proc)
      #}

      #{ Create the isolate_layers command.
      #
      cmd = @@command[:isolate_layers]= UI::Command.new("Isolate Layers") { 
        isolate_layers()
      }
      cmd.small_icon = File.join(BASEPATH, "images/isolate_layers_small.png")
      cmd.large_icon = File.join(BASEPATH, "images/isolate_layers_large.png")
      cmd.menu_text = @@menutext[:isolate_layers]
      cmd.status_bar_text = cmd.tooltip = @@tooltips[:isolate_layers]
      cmd.set_validation_proc(&@@select_proc)
      #}

      #{ Create the hide_entities command.
      #
      cmd = @@command[:hide_entities]= UI::Command.new("Hide Entities") { 
        hide_entities()
      }
      cmd.small_icon = File.join(BASEPATH, "images/hide_entities_small.png")
      cmd.large_icon = File.join(BASEPATH, "images/hide_entities_large.png")
      cmd.menu_text = @@menutext[:hide_entities]
      cmd.status_bar_text = cmd.tooltip = @@tooltips[:hide_entities]
      cmd.set_validation_proc(&@@select_proc)
      #}

      #{ Create the isolate_entities command.
      #
      cmd = @@command[:isolate_entities]= UI::Command.new("Isolate Entities") { 
        isolate_entities()
      }
      cmd.small_icon = File.join(BASEPATH, "images/isolate_entities_small.png")
      cmd.large_icon = File.join(BASEPATH, "images/isolate_entities_large.png")
      cmd.menu_text = @@menutext[:isolate_entities]
      cmd.status_bar_text = cmd.tooltip = @@tooltips[:isolate_entities]
      cmd.set_validation_proc(&@@select_proc)
      #}

      #{ Create the freeze_entities command.
      #
      cmd = @@command[:freeze_entities]= UI::Command.new("Freeze Groups and Components") { 
        freeze_groups_and_components()
      }
      cmd.small_icon = File.join(BASEPATH, "images/freeze_groups_and_components_small.png")
      cmd.large_icon = File.join(BASEPATH, "images/freeze_groups_and_components_large.png")
      cmd.menu_text = @@menutext[:freeze_entities]
      cmd.status_bar_text = cmd.tooltip = @@tooltips[:freeze_entities]
      cmd.set_validation_proc(&@@select_proc)
      #}

      #{ Create the unfreeze_all command.
      #
      cmd = @@command[:unfreeze_all]= UI::Command.new("Unfreeze All") { 
        unfreeze_all()
      }
      cmd.small_icon = File.join(BASEPATH, "images/unfreeze_all_small.png")
      cmd.large_icon = File.join(BASEPATH, "images/unfreeze_all_large.png")
      cmd.menu_text = @@menutext[:unfreeze_all]
      cmd.status_bar_text = cmd.tooltip = @@tooltips[:unfreeze_all]
      #}

      #{ Create the show_all command.
      #
      cmd = @@command[:show_all]= UI::Command.new("Show All") { 
        show_all()
      }
      cmd.small_icon = File.join(BASEPATH, "images/show_all_small.png")
      cmd.large_icon = File.join(BASEPATH, "images/show_all_large.png")
      cmd.menu_text = @@menutext[:show_all]
      cmd.status_bar_text = cmd.tooltip = @@tooltips[:show_all]
      #}

      # ----------------------------------------------------------------------------
      # Create and add the VisTools submenu.
      #{----------------------------------------------------------------------------
      @@submenu = UI.menu("Plugins").add_submenu( @@menutext[:plugin_name] )
      @@command.each{|key,cmd|
        @@submenu.add_item cmd
      }
      @@submenu.add_separator
      cmd = @@submenu.add_item(@@menutext[:debug_mode]){ debug(!@@debug) }
      @@submenu.set_validation_proc(cmd) { @@debug_state }
      #}

      # ----------------------------------------------------------------------------
      # Create and add the VisTools context menu shortcuts.
      #{----------------------------------------------------------------------------
      UI.add_context_menu_handler do |context_menu|
        context_menu.add_separator
        popout = context_menu.add_submenu( @@menutext[:plugin_name] )
        @@command.each{|key,cmd|
          popout.add_item cmd
        }
      end #}

      # ----------------------------------------------------------------------------
      # Create and add the VisTools toolbar.
      #{----------------------------------------------------------------------------
      @@toolbar = UI::Toolbar.new(@@menutext[:plugin_name])
      @@command.each{|key,cmd|
        @@toolbar.add_item cmd
      }
      # show it:
      if @@toolbar.get_last_state != TB_HIDDEN
        UI.start_timer(1.0, false) {
          if @@toolbar.get_last_state == TB_VISIBLE
            @@toolbar.restore
          else
            @@toolbar.show
          end
        }  
      end #}

      # register the file as loaded:
      file_loaded(File.join(BASEPATH, 'VisTools.rb'))

      cmd = nil # cleanup

    end #} if the file has not been loaded

  end # module VisTools

end # module IntrepidBear

# ... "Look Mom! No code outside the author's namespaces."