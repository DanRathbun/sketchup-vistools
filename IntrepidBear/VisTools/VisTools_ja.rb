#
#  THIS FILE MUST BE SAVED IN ENCODING:  "UTF-8 WITHOUT BOM"
#
module IntrepidBear  # <--<< Dana Woodman's proprietary toplevel namespace

  module VisTools    # <--<< THIS plugin's nested namespace

    #{# MODULE VARIABLE LANGUAGE HASHES
    #
      # --====  JAPANESE  ====-- #

      @@menutext = Hash[
        :plugin_name,      'ショー ＆ ツールを非表示',
        #
        :hide_layers,      'レイヤーを非表示',
        :isolate_layers,   '分離層',
        :hide_entities,    'エンティティを非表示',
        :isolate_entities, '分離エンティティ',
        :freeze_entities,  'エンティティのフリーズ',
        :unfreeze_all,     'すべて解凍',
        :show_all,         '「すべて表示」',
        #
        :debug_mode,       'デバッグ モード'
      ]

      @@tooltips = Hash[
        :hide_layers,      '選択したレイヤーを非表示',
        :isolate_layers,   '選択したレイヤーを分離',
        :hide_entities,    '選択したエンティティを非表示',
        :isolate_entities, '選択したエンティティを分離',
        :freeze_entities,  'グループとコンポーネントの凍結',
        :unfreeze_all,     'すべてを解凍',
        :show_all,         'すべてのレイヤーとエンティティを表示'
      ]
    #
    #}#

  end # module VisTools

end # module IntrepidBear
