@echo off
@chcp 65001
bin\cotoco.exe /nologo /Fo out\cotopha.co cotopha.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\init.co init.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\structs.co structs.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\ConfigDataBase.co ConfigDataBase.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\SystemObject.co SystemObject.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\start_screens.co start_screens.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\AdvScreen.co AdvScreen.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\AppreciationView.co AppreciationView.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\yosuga.co yosuga.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\bgm.co bgm.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotoco.exe /nologo /Fo out\BustupManager.co BustupManager.cos | bin\iconv -f SHIFT_JIS -t UTF-8
bin\cotolink.exe /nologo /Lo out\yosuga_rev.csx out\cotopha.co out\init.co out\structs.co out\ConfigDataBase.co out\SystemObject.co out\start_screens.co out\yosuga.co out\AdvScreen.co out\AppreciationView.co out\bgm.co out\BustupManager.co | bin\iconv -f SHIFT_JIS -t UTF-8
bin\sora_tool.exe --export --input out/yosuga_rev.csx --output ../data/
